with raylib;
with Interfaces.C.Strings;

package body Graphics is

   package ICS renames Interfaces.C.Strings;

   procedure DrawGrid (Self : Grid) is
      use raylib;
      matrix_width  : constant C_float := C_float (Self.CellSize * Self.ColCount);
      matrix_height : constant C_float := C_float (Self.CellSize * Self.RowCount);
      grid_color : raylib.Color := (30, 30, 30, 255);
      line_start, line_end : raylib.Vector2;

   begin
      for Row in 0..Self.RowCount loop
         line_start := (0.0, C_float(Row * Self.CellSize));
         line_end := (matrix_width, line_start.y);
         raylib.shapes.draw_line_ex (line_start, line_end, 2.0, grid_color);
      end loop;
      for Col in 0..Self.ColCount loop
         line_start := (C_float(Col * Self.CellSize), 0.0);
         line_end := (line_start.x, matrix_height);
         raylib.shapes.draw_line_ex (line_start, line_end, 2.0, grid_color);
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
      use raylib;
      cell_color : raylib.Color;
   begin
      for Col in 1..Self.ColCount loop
         for Row in 1..Self.RowCount loop
            if Cells (Col, Row) = 1
            then cell_color := (20, 230, 20, 255);
            else cell_color := (220, 220, 220, 255);
            end if;
            raylib.shapes.draw_rectangle (posx => int((Col-1)*Self.CellSize),
                                          posy => int((Row-1)*Self.CellSize),
                                          width  => int(Self.CellSize),
                                          height => int(Self.CellSize),
                                          c => cell_color);
         end loop;
      end loop;
   end DrawCells;

end Graphics;
