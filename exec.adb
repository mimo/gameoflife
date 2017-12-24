with sl_h;
with Sigil;
with Interfaces.C.Strings;

with Graphics;
with Entities;

procedure Exec is

   use type Interfaces.C.int;
   package Gfx renames Graphics;

   Place : Gfx.Grid;
   Cells : Entities.GridArray := Entities.Populate (Place.ColCount, Place.RowCount);

begin
   Sigil.Window (Gfx.Width (Place),
                 Gfx.Height (Place),
                 "Game Of Life",
                 False);

   SIGIL.SetBackColor(0.3, 0.3, 0.3);

   while not SIGIL.ShouldClose loop

      Gfx.DrawCells (Place, Cells);
      Gfx.DrawGrid  (Place);

      SIGIL.Render;
   end loop;

   SIGIL.Close;
end Exec;
