with Sigil;

with Interfaces.C.Strings;
with sl_h;

package body Graphics is

   package ICS renames Interfaces.C.Strings;

   procedure DrawGrid (Self : Grid) is
      Width : constant Positive := Self.CellSize * Self.ColCount;
      Height : constant Positive := Self.CellSize * Self.RowCount;
      X, Y : Positive;
   begin
      Sigil.SetForeColor (0.0, 0.0, 0.0, 1.0);
      for Row in 1..Self.RowCount loop
         Y := Row * Self.CellSize;
         Sigil.Line (0, Y, Width, Y);
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

   procedure DrawCells (Self : Grid ; Cells : Entities.GridArray ; Value : Entities.NeighbourhoodArray) is
      use Entities;
      fontID : Interfaces.C.Int;
      FontSize : Positive := 12;
      Padding : Natural := (Self.CellSize-FontSize) / 2;
   begin
      fontID := sl_h.slLoadFont(fontFilename => ICS.New_Char_Array("font.ttf"));
      sl_h.slSetFont (fontID, Interfaces.C.int(FontSize));

      for Col in 1..Self.ColCount loop
         for Row in 1..Self.RowCount loop
            if Cells (Col, Row) = 1
            then SIGIL.SetForeColor (0.0, 1.0, 0.0, 1.0);
            else SIGIL.SetForeColor (1.0, 1.0, 1.0, 1.0);
            end if;
            SIGIL.RectangleFill ((Col-1)*Self.CellSize, (Row-1)*Self.CellSize, Self.CellSize, Self.CellSize);

            SIGIL.SetForeColor (0.0, 0.0, 0.0, 1.0);
            SIGIL.Text (x    => Float((Col-1)*Self.CellSize),
                        y    => Float((Row-1)*Self.CellSize + Padding),
                        Text => Value(Col, Row)'Image );
         end loop;
      end loop;
   end DrawCells;

end Graphics;
