//- Change directory to here
//- vlib work
//- vmap work work
//- vlog test_streaming01.sv
//- vsim test_streaming01
//> run

//Sample 2.42 Basic streaming operator

module test_streaming01;

  int h;
  bit [7:0] b, g[4], j[4] = '{8'ha, 8'hb, 8'hc, 8'hd };
  bit [7:0] q, r, s, t;

  bit [15:0] wq[$] = {16'h1234, 16'h5678 };
  bit [7:0] bq[$];

  typedef struct { int a;
                   byte b;
                   shortint c;
                   int d;
                 } struct_s

  struct_s st = '{32'haaaa_aaaa,
                   8'hbb,
                   16'hcccc,
                   32'hdddd_dddd
                 };

  byte b[];

  initial begin

     //stream from left to right
     h = {>> {j}};   // 0a0b0c0d - pack array into int
     $display("h={>> {j}}, h=%h", h);

     //stream from right to left, reverse bits
     h = {<< {j}};    // b030d050
     $display("h={<< {j}}, h=%h", h);

     //stream from right to left, reverse bytes
     h = {<< byte {j}};   // 0d0c0b0a
     $display("h={<< byte {j}}, h=%h", h);

     //stream from right to left
     g = {<< byte {j}};   //0d, 0c, 0b, 0a unpack into array
     $display("g={<< byte {j}}, g[]=%h,%h,%h,%h", g[0],g[1],g[2],g[3]);

     //stream from right to left, reverse bits
     b = {<< {8'b0011_0101}};  // 1010_1100 reverse bits
     $display("b = {<< {8'b0011_0101}}, b=%b", b);

     //stream from right to left, reverse nibble
     b = {<< 4 {8'b0011_0101}};  // 0101_0011 reverse nibble
     $display("b = {<< 4 {8'b0011_0101}} b=%b", b);

     //Scatter j into bytes
     // q=0a, r=0b, s=0c, t=0d, j=0a_0b_0c_0d
     {>> {q, r, s, t}} = j;
     $display("{>> {q, r, s, t}} = j:  q=%h, r=%h, s=%h, t=%h, j=%h_%h_%h_%h", q, r, s, t, j[0],j[1],j[2],j[3]);


     //Gather bytes into h
     h = {>> {t, s, r, q}};
     $display("h = {>> {t, s, r, q}} h=%h", h);   //0d0c0b0a

     //Queue
     // Convert 16-bit word array to byte
     bq = {>> {wq}};    //12, 34, 56, 78

     foreach (bq[i])
        bq[i] = bq[i]+1;

     wq = {>> {bq}};    //1335, 5779
     $display("wq=%h_%h", wq[0], wq[1]);

     //Structure
     b = {>> {st}};   //{aa aa aa aa bb cc cc dd dd dd dd}

  end

endmodule : test_streaming01


