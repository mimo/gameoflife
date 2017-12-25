with Sigil;

package body Graphics is

   procedure DrawGrid (Self : Grid) is
      Width : constant Positive := Self.CellSize * Self.ColCount;
      Height : constant Positive := Self.CellSize * Self.RowCount;
      X, Y : Positive;
   begin
      Sigil.SetForeColor (0.0, 0.0, 0.0, 1.0);
      for Row in 1..Self.RowCount loop
         Y := Row * Self.CellSize;
         Sigil.Line (0,Y, Width, Y);
      end loop;
      for Col in 1..Self.ColCount loop
         X := Col * Self.CellSize;
         Sigil.Line (X, 0, X, Height);
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

   procedure DrawCells (Self : Grid; Cells : Entities.GridArray) is
      use Entities;
   begin
      for Col in 0..Self.ColCount-1 loop
         for Row in 0..Self.RowCount-1 loop
            if Cells(Col+1,Row+1) = 1 then SIGIL.SetForeColor (0.0, 1.0, 0.0, 1.0);
            else SIGIL.SetForeColor (1.0, 1.0, 1.0, 1.0);
            end if;
            SIGIL.RectangleFill (Col*Self.CellSize, Row*Self.CellSize, Self.CellSize, Self.CellSize);
         end loop;
      end loop;
   end DrawCells;


end Graphics;
