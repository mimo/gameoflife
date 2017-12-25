with sl_h;
with Sigil;
with Interfaces.C.Strings;

with Graphics;
with Entities;

procedure Exec is

   use type Interfaces.C.int;
   package Gfx renames Graphics;

   Place : Gfx.Grid := (CellSize => 24, RowCount => 29, ColCount=> 49);
   Cells : Entities.GridArray := Entities.Populate (Place.ColCount, Place.RowCount);
   Neighbours : Entities.NeighbourhoodArray (1..Place.ColCount, 1..Place.RowCount);

begin

   Sigil.Window (Gfx.Width (Place),
                 Gfx.Height (Place),
                 "Game Of Life",
                 False);

   SIGIL.SetBackColor (0.3, 0.3, 0.3);

   Neighbours := Entities.Get_Neighbours (Cells);

   while not SIGIL.ShouldClose loop
      delay 0.3;

      Gfx.DrawCells (Place, Cells, Neighbours);
      Gfx.DrawGrid  (Place);

      SIGIL.Render;
   end loop;

   SIGIL.Close;

end Exec;
