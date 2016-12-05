//- Change directory to here
//- vlib work
//- vmap work work
//- vlog test_arr03.sv
//- vsim test_arr03
//> run

//A common annoyance in Verilog-1995 is that you cannot use
//array and bit subscripts together. Verilog-2001 removes
//this restriction for fixed-size arrays.

//output:
//  00000000000000000000000000000101 1 10

module test_arr03;
  initial begin
    bit[31:0] src[5] = '{5{5}};
    $displayb(src[0],,       //additional , adding
              src[0][0],,    //a space between.
              src[0][2:1]);
  end
endmodule: test_arr03
