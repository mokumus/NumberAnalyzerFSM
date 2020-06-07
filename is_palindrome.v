module is_palindrome(
	input [31:0] A,
	output O
);

wire [15:0] R;


xnor xn1 (R[0], A[0], A[31]);
xnor xn2 (R[1], A[1], A[30]);
xnor xn3 (R[2], A[2], A[29]);
xnor xn4 (R[3], A[3], A[28]);
xnor xn5 (R[4], A[4], A[27]);
xnor xn6 (R[5], A[5], A[26]);
xnor xn7 (R[6], A[6], A[25]);
xnor xn8 (R[7], A[7], A[24]);
xnor xn9 (R[8], A[8], A[23]);
xnor xn10(R[9], A[9], A[22]);
xnor xn11(R[10], A[10], A[21]);
xnor xn12(R[11], A[11], A[20]);
xnor xn13(R[12], A[12], A[19]);
xnor xn14(R[13], A[13], A[18]);
xnor xn15(R[14], A[14], A[17]);
xnor xn16(R[15], A[15], A[16]);

and a1(O, R[0], R[1], R[2], R[3], R[4], R[5], R[6], R[7], R[8], R[9], R[10], R[11], R[12], R[13], R[14], R[15] );




endmodule