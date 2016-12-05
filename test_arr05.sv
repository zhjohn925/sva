//Sample 2.21 Declaring, initializing, and using
//  associative arrays

module test_arr05;

  integer r = 0;
  bit [63:0] idx = 1;

  initial begin

    //index range of longint up to (1<<63-1), so repeat(63) in below
    //bit [63:0] assoc[longint];
    bit [63:0] assoc[bit[63:0]];

    //if no automatic, will get the waining
    //** Warning: test_arr05.sv(7): (vlog-LRM-2244) Variable 'idx' is implicitly
    //   static. You must explicitly declare it as static or automatic.
    //automatic bit [63:0] idx = 1;

    //Initialize widely scattered values
    repeat (64) begin
      assoc[idx] = idx;
      idx = idx<<1;
    end

    //Step through all index values with foreach
    $display("foreach: ");
    foreach (assoc[i])
      $display("assoc[%h] = %h", i, assoc[i]);

    //Step through all index values with functions
    $display("first-next-last: ");
    if (assoc.first(idx))       //get first index
    begin
      do
        $display("assoc[%h] = %h", idx, assoc[idx]);
      while (assoc.next(idx));  //get next index
    end

    //find and delete the first element
    //if not assigned to r, will get
    //(vlog-2240) Treating stand-alone use of function 'first' as an implicit VOID cast.
    r = assoc.first(idx);
    assoc.delete(idx);

    $display("The array now has %0d elements", assoc.num());
  end
endmodule : test_arr05
