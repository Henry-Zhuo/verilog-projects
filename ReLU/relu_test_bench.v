/* A collection of test benches for testing ReLU modules. */


/* Tests the width-parameterized ReLU module.

    Once the module under testing is known to be working, 
    propagation_delay can be lowered to find the minimum number of clock cycles
    needed for the module under testing to succeed.
*/
module relu_test_bench #(
    parameter WIDTH = 64,
    parameter propagation_delay = 1
) ();

reg[WIDTH-1:0] input_num;
wire[WIDTH-1:0] output_num;
wire equal_nums;

relu_width_parameterized #(WIDTH) relu_module (
    .num        (input_num),
    .relu_num   (output_num)
);


assign equal_nums = input_num == output_num;

initial begin
    // Can't use $monitor because of use of $bitstoreal() to print floating point values
    input_num = $realtobits(1.0);
    #(propagation_delay)
    log_result(input_num, output_num, equal_nums);

    input_num = $realtobits(0.1);
    #(propagation_delay)
    log_result(input_num, output_num, equal_nums);

    input_num = $realtobits(0.0);
    #(propagation_delay)
    log_result(input_num, output_num, equal_nums);

    input_num = $realtobits(-0.1);
    #(propagation_delay)
    log_result(input_num, output_num, equal_nums);

    input_num = $realtobits(-1.0);
    #(propagation_delay)
    log_result(input_num, output_num, equal_nums);

    $finish;
end



// Prints values of input and output
// ReLU succeeds when input == output for input >= 0,
// or output == 0.0 for input < 0.0
task log_result(input[WIDTH-1:0] input_num, input[WIDTH-1:0] output_num, input equal_nums);
    if (($bitstoreal(input_num) >= 0.0 && equal_nums) || ($bitstoreal(output_num) == 0.0 && $bitstoreal(input_num) < 0.0))
        $display("Success. input = %f, output = %f", $bitstoreal(input_num), $bitstoreal(output_num));
    else
        $display("FAILURE. input = %f, output = %f", $bitstoreal(input_num), $bitstoreal(output_num));
endtask

endmodule
