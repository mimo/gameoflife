with Ada.Numerics.Discrete_Random ;

package entities is

   type CellValue is range 0..1;
   type GridArray is array (Positive range <>, Positive range <>) of CellValue;
   package CellValueRandom is new Ada.Numerics.Discrete_Random (CellValue);
   CellValueGenerator : CellValueRandom.Generator; 

   function Populate (X, Y : Positive) return GridArray;
   
end entities;
