//- Change directory to here
//- vlib work
//- vmap work work
//- vlog test_arr11.sv
//- vsim test_arr11
//> run

//Sample 2.31  A scoreboard with array methods

module test_arr11;
  typedef struct packed {
    bit [7:0] addr;
    bit [7:0] pr;
    bit [15:0] data;
  } Packet;

  Packet scb[$], p;

  function void check_addr(bit [7:0] addr);
    int intq[$];
    intq = scb.find_index() with (item.addr == addr);
    case (intq.size())
      0 : $display("Addr %h not found in scoreboard", addr);
      1 : begin
          scb.delete(intq[0]);
          $display("Addr %h is found in scoreboard", addr);
          end
      default:
         $display("Error: Multiple hits for addr %h", addr);
    endcase
  endfunction : check_addr

  initial begin
     check_addr('h33);
     p.addr = 'h33;
     scb.push_back(p);
     check_addr('h33);
  end

endmodule: test_arr11
