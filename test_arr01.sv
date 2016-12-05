//- Change directory to here
//- vlib work
//- vmap work work
//- vlog test_arr01.sv
//- vsim test_arr01
//> run

module test_arr01;
   int md[2][3] = '{'{0,1,2}, '{3,4,5}};
   initial begin
      $display("Initial value: ");
      foreach (md[i, j])
         $display("md[%0d][%0d] = %0d", i, j, md[i][j]);

      $display("New value: ");
      // Replicate last 3 values of 5
      md = '{'{9, 8, 7}, '{3{5}}};
      foreach (md[i,j])
         $display("md[%0d][%0d] = %0d", i, j, md[i][j]);
   end
endmodule: test_arr01
