//- Change directory to here
//- vlib work
//- vmap work work
//- vlog test_arr03.sv
//- vsim test_arr03
//> run

//Shows dynamic array


module test_arr04;
  int dyn[], d2[];
  int a[] = '{1, 2, 3};
  initial begin
    dyn = new [5];
    foreach (dyn[i])
       dyn[i] = i;
    d2 = dyn;
    d2[0] = 5;
    $display(dyn[0], d2[0]);

    //allocate 20 ints & copy 5 elements at the beginning
    //  the rest 15 ints are un-defined as zeros.
    //this kind of copy will hit the performance issue since
    //  new allocation is taken place
    dyn = new [20] (dyn);
    foreach (dyn[i])
      $display(dyn[i]);

    $display("a[]:  ");
    foreach (a[i]) $display(a[i]);

    dyn.delete();

    $display("d2[]:  ");
    //this will display 5 1 2 3 4
    foreach (d2[i]) $display(d2[i]);

    d2.delete();

    $display("d2[]:  ");
    //nothing to display since no element in d2[] after delete
    foreach (d2[i]) $display(d2[i]);

  end
endmodule: test_arr04
