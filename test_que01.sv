module test_que01;
  int j = 1,
      q2[$] = {3, 4},
      q[$] = {0, 2, 5};

  initial begin
    q.insert(1, j);   //{0, 1, 2, 5}
    q.insert(3, q2[0]);  //{0, 1, 2, 3, 5}
    q.insert(4, q2[1]);  //{0, 1, 2, 3, 4, 5}
    foreach (q[i]) $display(q[i]);
    q.delete(1);      //{0, 2, 3, 4, 5}


    //These operation are fast
    q.push_front(6);  //{6, 0, 2, 3, 4, 5}
    j = q.pop_back;   //{6, 0, 2, 3, 4}  j=5
    q.push_back(8);   //{6, 0, 2, 3, 4, 8}
    j = q.pop_front;  //{0, 2, 3, 4, 8}  j=6
    $display("----");
    foreach (q[i]) $display(q[i]);
    q = {q[0], 1, q[1:$]};    //{0, 1, 2, 3, 4, 8}
    $display("----");
    foreach (q[i]) $display(q[i]);
    q = {q[0:4], 5, 6, 7, q[5]}; //{0, 1, 2, 3, 4, 5, 6, 7, 8}
    $display("----");
    foreach (q[i])
       $display(q[i]);
    q.delete();       //{}
  end
endmodule : test_que01
