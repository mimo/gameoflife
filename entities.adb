
package body Entities is

   function Populate (X, Y : Positive) return GridArray is
      Grid : GridArray (1..X, 1..Y);
   begin
      for Col in 1..X loop
         CellValueRandom.Reset (CellValueGenerator);
         for Row in 1..Y loop
            Grid (Col, Row) := CellValueRandom.Random (CellValueGenerator);
         end loop;
      end loop;

      return Grid;
   end Populate;

   function Get_Neighbours (Matrix : GridArray) return NeighbourhoodArray is
      Neighbours : NeighbourhoodArray (Matrix'range, Matrix'Range (2));
   begin
      for x in Matrix'range (1) loop
         for y in Matrix'Range (2) loop
            Neighbours (x, y) := Count_Neighbours (Matrix, x, y);
         end loop;
      end loop;
      return Neighbours;
   end Get_Neighbours;

   function Count_Neighbours (Matrix : GridArray; CellX, CellY : Positive) return Neighbourhood is
      Count : Neighbourhood := 0;
      NeighbourX, NeighbourY : Integer;
      FirstCol : constant Positive := Matrix'First (1);
      LastCol : constant Positive := Matrix'Last (1);
      FirstRow : constant Positive := Matrix'First (2);
      LastRow : constant Positive := Matrix'Last (2);
   begin

      for modx in -1..1 loop
         NeighbourX := CellX+modx;

         if NeighbourX >= FirstCol and
           NeighbourX <= LastCol then

            for mody in -1..1 loop
               NeighbourY := CellY+mody;

               if not (modx = 0 and mody = 0) and
                 NeighbourY >= FirstRow and
                 NeighbourY <= LastRow then
                  if Matrix (NeighbourX, NeighbourY) = 1 then
                     Count := Count + 1;
                  end if;
               end if;
            end loop;
         end if;
      end loop;

      return Count;
   end Count_Neighbours;

end Entities;
