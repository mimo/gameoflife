with Ada.Numerics.Discrete_Random ;

package entities is

   type CellValue is range 0..1;
   type GridArray is array (Positive range <>, Positive range <>) of CellValue;
   package CellValueRandom is new Ada.Numerics.Discrete_Random (CellValue);
   CellValueGenerator : CellValueRandom.Generator; 

   function Populate (X, Y : Positive) return GridArray;
   
   type Neighbourhood is range 0..8;
   type NeighbourhoodArray is array (Positive range <>, Positive range <>) of Neighbourhood;
   function Get_Neighbours (Matrix : GridArray) return NeighbourhoodArray;
   function Count_Neighbours (Matrix : GridArray; CellX, CellY : Positive) return Neighbourhood;

   procedure Apply_Rules (Matrix : in out GridArray);
   
end entities;
