
package entities is

   type CellValue is range 0..1;
   type GridArray is array (Positive range <>, Positive range <>) of CellValue;

   function Populate (X, Y : Positive) return GridArray;
   procedure Apply_Rules (Matrix : in out GridArray);

end entities;
