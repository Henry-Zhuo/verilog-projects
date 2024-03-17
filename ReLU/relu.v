/* A collection of hardware modules implementing the Rectified Linear Unit
    (ReLU) function, common in artificial neural networks and deep learning.
*/


/* A width-parameterized implementation. Doesn't matter if input is 16-bit, 32-bit,
    etc., as long as WIDTH parameter is correctly set.
    By default, uses the IEEE 754 floating point standards, with the leftmost
    bit (index WIDTH - 1) being the sign bit.
*/
module relu_width_parameterized #(
    parameter WIDTH = 16
) (
    input [WIDTH-1:0] num,
    output reg[WIDTH-1:0] relu_num
);

always @(num) begin
    relu_num = {num[WIDTH-1:WIDTH-1], ({(WIDTH-1){~num[WIDTH-1]}} & num[WIDTH-2:0])};
end

endmodule
