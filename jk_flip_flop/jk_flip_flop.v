module jk_flip_flop (
    input clock,
    input j,
    input k,
    output reg q,
    output reg q_not
);
/* To have 3-input NAND gate using only 2-input NAND gates,
    use ((j ~& clock) ~& j ~& clock)) ~& ((q_not ~& q_not) ~& (q_not ~& q_not)).
    Putting q_not through NAND gates is only necessary if propagation delay
    should be matched between j, clock, and q_not when going through the 3-input
    NAND gate.
*/

reg s_not;
reg r_not;

initial begin
    assign s_not = 1;
    assign r_not = 0;
    assign q = 0;
    assign q_not = 1;
end

// JK flip flop logic
always @(posedge clock) begin
    s_not <= ~(j & clock & q_not);
    r_not <= ~(k & clock & q);
    q <= s_not ~& q_not;
    q_not <= r_not ~& q;
end

endmodule
