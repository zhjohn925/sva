//- Change directory to here
//- vlib work
//- vmap work work
//- vlog test_arr06.sv
//- vsim test_arr06
//> run

//Sample 2.21 Declaring, initializing, and using
//  associative arrays with string index

module test_arr06;
  int switch[string];
  int min_address, max_address;

  initial begin
    int i, r, file;
    string s;

    file = $fopen("switch.txt", "r");
    while (! $feof(file)) begin
      r = $fscanf(file, "%d %s", i, s);
      switch[s] = i;
    end
    $fclose(file);

    //get the min address, default is 0
    if (switch.exists("min_address"))
      min_address = switch["min_address"];
    else
      min_address = 0;

    //get the max address, default is 1000
    if (switch.exists("max_address"))
      max_address = switch["max_address"];
    else
      max_address = 1000;

    $display("Print all switches: ");
    foreach (switch[j])
       $display("switch[%s]=%0d", j, switch[j]);
  end

endmodule : test_arr06
