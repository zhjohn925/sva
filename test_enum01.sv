//- Change directory to here
//- vlib work
//- vmap work work
//- vlog test_enum01.sv
//- vsim test_enum01
//> run

module test_enum01;
  typedef enum {RED, BLUE, GREEN} color_e;
  int c;

  initial begin
    color_e color;
    color = color.first;
    c = color.next;
    $display("c=%d", c);   // c = 1
    do begin
         $display("Color = %0d/%s", color, color.name);
         // Color = 0/RED
         // Color = 1/BLUE
         // Color = 2/GREEN
         color = color.next;
       end
    while (color != color.first);   //Done at wrap-around
  end

endmodule : test_enum01
