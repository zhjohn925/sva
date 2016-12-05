//- Change directory to here
//- vlib work
//- vmap work work
//- vlog test_arr01.sv
//- vsim test_arr01
//> run

module test_arr02;
  initial begin
  byte twoD[4][6];
  foreach (twoD[i, j])
     twoD[i][j] = i*10+j;

  foreach (twoD[i]) begin  //Step through first dimension
    $write("%2d: ", i);
    foreach(twoD[,j])      //Step through second dimension
      $write("%3d", twoD[i][j]);
    $display;
  end
  end
endmodule: test_arr02
