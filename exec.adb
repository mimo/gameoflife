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

begin

   Sigil.Window (Gfx.Width (Place),
                 Gfx.Height (Place),
                 "Game Of Life",
                 False);

   SIGIL.SetBackColor (0.3, 0.3, 0.3);

   while not SIGIL.ShouldClose loop
      delay 0.8;

      Gfx.DrawCells (Place, Cells);
      Gfx.DrawGrid  (Place);

      SIGIL.Render;

      Entities.Apply_Rules (Cells);
   end loop;

   SIGIL.Close;

end Exec;
