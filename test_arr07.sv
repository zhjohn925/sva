//- Change directory to here
//- vlib work
//- vmap work work
//- vlog test_arr07.sv
//- vsim test_arr07
//> run

//Sample 2.23 Creating the sum of an array
// (???) the description does not match what I saw in Questasim
// Be careful of SystemVerilog’s rules for handling  the width of operations.
// By default, if you add the values of a single-bit array, the result is a single bit.
// However, if you use it in a 32-bit expression, store the result in a 32-bit variable,
// compare it to a 32-bit variable, or use the proper 'with' expression.

module test_arr07;
  bit on[10];   //Array of single bits
  int total;

  initial begin
    foreach (on[i])  // i=0..9
       on[i] = i;    // on[i] gets 0 or 1

    //Print the single-bit sum
    $display("on.sum = %0d", on.sum);  //on.sum = 1

    //Print the sum using 32-bit total
    $display("on.sum = %0d", on.sum + 32'd0);  //on.sum = 1  (not 5 ???)
    total = on.sum with (int'(item));
    $display("total (with) = %0d", total);     //total = 5 (GOOD)
    total = on.sum;
    $display("total (no with) = %0d", total);     //total = 1 (not 5 ???)

    if (on.sum >= 32'd5)    //True
       $display("sum has 5 or more 1's");

    //Compute 'with' 32-bit signed arithimetic
    $display("int sum=%0d", on.sum with (int'(item)));   // int sum=5 (Good)

  end

endmodule: test_arr07


