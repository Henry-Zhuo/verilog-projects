module jk_flip_flop_test_bench ();

reg clock;
reg j;
reg k;
wire q;
wire q_not;

jk_flip_flop jk_dut (
    .clock  (clock),
    .j      (j),
    .k      (k),
    .q      (q),
    .q_not  (q_not)
);

initial begin
    clock = 1'b0;
    forever #1 clock = ~clock;
end

initial begin
    $monitor("time=%t, j = %b, k = %b, clock = %b, q = %b, q_not = %b", $time, j, k, clock, q, q_not);

    j = 1'b0;
    k = 1'b0;
    #10

    k = 1'b1;
    #10

    j = 1'b1;
    #10

    k = 1'b0;
    #10
    
    $finish;
end

endmodule
