module is_fibonacci_tb;

// Inputs
reg [31:0] A;
reg clock;
reg reset;

// Outputs
wire o_fibo, o_pal, o_odd;
wire done;

is_fibonacci fibo(clock, reset, A, o_fibo, done);
is_palindrome ip(A, o_pal);
is_odd io(A[0], o_odd);

initial begin
	clock = 0;
	forever #5 clock = ~clock;
end 

initial begin
	// Initialize Inputs
	//A = 32'b10110001000110010010010011100001; 	// 2971215073 Largest fibonacci number in 32bit
	//A = 32'b00000000000000000000000000000000;	// 0 Smallest fibo
	//A = 32'b00000000000000000000000000000001;	// 1
	//A = 32'b00000000000001001101100101110011; //Fibonacci 28 : 317811
	A = 32'b00111011100101001101100101000011;	// 999610691 not fibo
	reset = 1;
	// Wait for global reset to finish
	#30;	
	reset = 0;
end 

always@(*) begin
	if (done == 1) begin
		$display("A: %32b\n\tis_palindrome: %1b\n\tis_odd: %1b\n\tis_fibonacci: %1b", A, o_pal, o_odd, o_fibo);
		$stop;
	end
end

endmodule