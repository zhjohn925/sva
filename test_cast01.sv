//- Change directory to here
//- vlib work
//- vmap work work
//- vlog test_cast01.sv
//- vsim test_cast01
//> run


module test_cast01;
  typedef enum { RED, BLUE, GREEN }  COLOR_E;
  COLOR_E color, c2;
  int c;

  initial begin
    color = BLUE;
    c = color;         //Convert from enum to int (1)
    c++;
    if (!$cast(color, c))  //Cast int (c) back to enum (color)
      $display("Cast failed for c=%0d", c);
    else
      //output:  Color is 2 / GREEN
      $display("Color is %0d / %s", color, color.name);

    c++;    // 3 is out-of-bounds for enum
    c2 = COLOR_E'(c);     //static cast, no type checking

    //no c2.name
    //output: Color is 3 /
    $display("Color is %0d / %s", c2, c2.name);
  end

endmodule: test_cast01
