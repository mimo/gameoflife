package body entities is

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

end entities;
