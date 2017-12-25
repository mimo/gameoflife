with Entities;

package Graphics is

   type Grid is tagged record
      CellSize : Positive := 16;
      RowCount : Positive := 10;
      ColCount : Positive := 10;
   end record;
   
   procedure DrawGrid (Self : Grid);
   function  Width (Self : Grid) return Positive;
   function  Height (Self : Grid) return Positive;
   
   procedure DrawCells (Self : Grid; Cells : Entities.GridArray; Value : Entities.NeighbourhoodArray);
   
end Graphics;
