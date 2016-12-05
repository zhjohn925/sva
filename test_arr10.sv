//- Change directory to here
//- vlib work
//- vmap work work
//- vlog test_arr10.sv
//- vsim test_arr10
//> run

//Sorting an array of structures

module test_arr10;
  struct packed { byte red, green, blue; }  pixels[], p;
  initial begin
    pixels = new[20];
    foreach (pixels[i])
       pixels[i] = $urandom;    //fill with random values

    pixels.sort with (item.red);   //sort using red only

    //sort by green value then blue
    pixels.sort(x) with ({x.green, x.blue});

    foreach (pixels[i]) begin
       p = pixels[i];
       $display("red=%2h, green=%2h, blue=%2h",
          p.red, p.green, p.blue);
    end
  end
endmodule: test_arr10
