with raylib;
with Interfaces.C.Strings;

package body Graphics is

   package ICS renames Interfaces.C.Strings;

   procedure DrawGrid (Self : Grid) is
      Width : constant Positive := Self.CellSize * Self.ColCount;
      Height : constant Positive := Self.CellSize * Self.RowCount;
      X, Y : Positive;
   begin
      --Sigil.SetForeColor (0.0, 0.0, 0.0, 1.0);
      for Row in 1..Self.RowCount loop
         Y := Row * Self.CellSize;
         --Sigil.Line (0, Y, Width, Y);
         --raylib.draw_line ();
      end loop;
      for Col in 1..Self.ColCount loop
         X := Col * Self.CellSize;
         --Sigil.Line (X, 0, X, Height);
          --raylib.draw_line ();
      end loop;
   end DrawGrid;

   function Width (Self : Grid) return Positive is
   begin
      return Self.CellSize * Self.ColCount;
   end Width;

   function Height (Self : Grid) return Positive is
   begin
      return Self.CellSize * Self.RowCount;
   end Height;

   procedure DrawCells (Self : Grid ; Cells : Entities.GridArray) is
      use Entities;
      cell_color : raylib.Color;
   begin
      for Col in 1..Self.ColCount loop
         for Row in 1..Self.RowCount loop
            if Cells (Col, Row) = 1
            then cell_color := (0, 255, 0, 255);
            else cell_color := (220, 220, 220, 255);
            end if;
            raylib.shapes.draw_rectangle (posx => (Col-1)*Self.CellSize,
                                          posy => (Row-1)*Self.CellSize,
                                          Width  => Self.CellSize,
                                          Height => Self.CellSize,
                                          c => cell_color);
         end loop;
      end loop;
   end DrawCells;

end Graphics;
