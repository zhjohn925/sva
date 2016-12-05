//- Change directory to here
//- vlib work
//- vmap work work
//- vlog test_arr01.sv
//- vsim test_arr01
//> run


// If you need to choose a random element from an associative array,
// you need to step through the elements one by one as there is no direct
// way to access the Nth element.

module test_arr08;
  int aa[int];
  int count = 0;
  int rand_idx, element;
  int idx = 1;

  initial begin
    repeat (10) begin
      aa[idx] = idx;
      idx = idx<<1;
    end

    $display("aa.size=%0d", aa.size());

    repeat(10) begin
      count = 0;
      element = $urandom_range(aa.size() - 1);
      foreach(aa[i])
        if (count++ == element) begin
          rand_idx = i;    //save the associative array index
          break;
        end
      $display("element %0d in aa[%h] = %h",
             element, rand_idx, aa[rand_idx]);
    end
  end
endmodule: test_arr08
