//- Change directory to here
//- vlib work
//- vmap work work
//- vlog test_arr01.sv
//- vsim test_arr01
//> run


//(??? donot work as described ???)
//In this example, the sum operator totals the number of times that the
//expression is true. For the first statement, there are two array elements
//that are greater than 7 (9 and 8) and so count is set to 2.



module test_arr09;
   int count, total, d[]='{9, 1, 8, 3, 4, 4, 8};
   initial begin
     //donot work as expected (???)  expect count=3  but actual 1
     count = d.sum with (item>7);
     $display("count = d.sum with (item>7): count=%0d", count);

     //sum of {9, 8, 8}, total = 25
     total = d.sum with ((item>7)*item);
     $display("d.sum with ((item>7)*item): total=%0d", total);

     //donot work as expected (???)  expect count=4  but actual 0
     count = d.sum with (item<8);
     $display("count = d.sum with (item<8): count=%0d", count);

     //sum of {1, 3, 4, 4}, total = 12
     total = d.sum with (item<8 ? item : 0);
     $display("d.sum with (item<8 ? item : 0): total=%0d", total);

     //donot work as expected (???)  expect count=2  but actual 0
     count = d.sum with (item==4);
     $display("d.sum with (item==4), count=%0d", count);
   end
endmodule: test_arr09
