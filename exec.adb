with raylib;

with Graphics;
with Entities;

procedure Exec is

   package Gfx renames Graphics;

   Place : Gfx.Grid := (CellSize => 24, RowCount => 29, ColCount=> 49);
   Cells : Entities.GridArray := Entities.Populate (Place.ColCount, Place.RowCount);

begin

   raylib.Window.init (
      Gfx.Width  (Place),
      Gfx.Height (Place),
      "Game Of Life");

   raylib.set_target_FPS (2);

   while not raylib.window.should_close loop

      raylib.begin_drawing;
      raylib.clear_background (raylib.RAYWHITE);

      Gfx.Draw (Place, Cells);

      raylib.end_drawing;

      Entities.Apply_Rules (Cells);

   end loop;

   raylib.window.close;

end Exec;
