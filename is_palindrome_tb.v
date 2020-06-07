module is_palindrome_tb;

reg [31:0] A;
wire O;

is_palindrome ip(A, O);

initial begin
	A = 32'b11111111111111111111111111111111;
	#30;	
	A = 32'b11111111111111111111111111111110;
	#30;	
	A = 32'b00000000000000000000000000000000;
	#30;	
	A = 32'b10000000000000000000000000000001;
	#30;	
	A = 32'b11010010011000011000011001001011;
	#30;
	A = 32'b11111111111111100000000000000000;
end 

initial begin
$monitor("A: %32b is_palindrome: %1b", A, O);
end

endmodule