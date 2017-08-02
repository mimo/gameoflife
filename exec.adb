with sl_h;
with Sigil;
with Interfaces.C.Strings;

with Ada.Numerics.Discrete_Random ;

procedure Exec is
   use type Interfaces.C.int;

   type Grid is tagged record
      CellSize : Positive := 16;
      RowCount : Positive := 10;
      ColCount : Positive := 10;
   end record;

   function Width (Self : Grid) return Positive is
   begin
      return Self.CellSize * Self.ColCount;
   end Width;

   function Height (Self : Grid) return Positive is
   begin
      return Self.CellSize * Self.RowCount;
   end Height;

   type CellValue is range 0..1;
   type GridArray is array (Positive range <>, Positive range <>) of CellValue;
   package CellValueRandom is new Ada.Numerics.Discrete_Random (CellValue);
   CellValueGenerator : CellValueRandom.Generator;

   function Populate (X, Y : Positive) return GridArray is
      Grid : GridArray (1..X, 1..Y);
   begin
      for Col in 1..X loop
         CellValueRandom.Reset (CellValueGenerator);
         for Row in 1..Y loop
            Grid (Col, Row) := CellValueRandom.Random (CellValueGenerator);
         end loop;
      end loop;

      return Grid;
   end Populate;


   procedure Draw (Self : Grid) is
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
   end;

   procedure DrawCells (Self : Grid; Cells : GridArray) is
   begin
      for Col in 0..Self.ColCount-1 loop
         for Row in 0..Self.RowCount-1 loop
            if Cells(Col+1,Row+1) = 1 then SIGIL.SetForeColor (0.0, 1.0, 0.0, 1.0);
            else SIGIL.SetForeColor (1.0, 1.0, 1.0, 1.0);
            end if;
            SIGIL.RectangleFill(Row*Self.CellSize, Col*Self.CellSize, Self.CellSize, Self.CellSize);
         end loop;
      end loop;
   end DrawCells;

   Place : Grid;
   Cells : GridArray := Populate (Place.ColCount, Place.RowCount);
begin
   Sigil.Window (Width (Place),
                 Height (Place),
                 "Game Of Life",
                 False);

   SIGIL.SetBackColor(0.3, 0.3, 0.3);

   while not SIGIL.ShouldClose loop

      DrawCells (Place, Cells);
      Draw (Place);

      SIGIL.Render;
   end loop;

   SIGIL.Close;
end Exec;
