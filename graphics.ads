with Entities;

package Graphics is

   type Grid is tagged record
      CellSize : Positive := 16;
      RowCount : Positive := 10;
      ColCount : Positive := 10;
   end record;
   
   function  Width (Self : Grid) return Positive;
   function  Height (Self : Grid) return Positive;
   
   procedure Draw (Self : Grid; Cells : Entities.GridArray);
   
end Graphics;
