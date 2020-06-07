module is_fibonacci(
	input CLK,
	input RESET,
	input [31:0] N,
	output reg O,
	output reg DONE
);

reg [31:0] a;
reg [31:0] b;
reg [31:0] c;

parameter 
	S0=3'b000,
	S1=3'b001,
	S2=3'b010,
	S3=3'b011,
	S4=3'b100,
	S5=3'b101,
	S6=3'b110,
	S7=3'b111;
	
reg [2:0] current_state, next_state;

// sequential memory
always @(posedge CLK, posedge RESET)
begin
	if(RESET==1)
		current_state <= S0;
	else
		current_state <= next_state;
end
		
// combinational logic
always @(current_state, N)
begin
	case(current_state)
	
	S0:begin
		//$display ("S0");
		next_state <= S1;
	end
	
	S1:begin
		//$display ("S1");
		a = 32'b00000000000000000000000000000000;
		b = 32'b00000000000000000000000000000001;
		next_state <= S2;
	end
	
	S2:begin
		//$display ("S2");
		if ( N == 32'b00000000000000000000000000000000 || N == 32'b00000000000000000000000000000001 )		
			next_state <= S5;
		else
			next_state <= S3;
	end
	
	S3:begin
		//$display ("S3");
		c = a + b;
		next_state <= S4;
	end
	
	S4:begin
		//$display ("S4");
		next_state <= S6;
	end
	
	S5:begin
		//$display ("S5");
	end
	
	S6:begin
		//$display ("S6");
		a = b;
		b = c;
		c = a + b;
		if( c == N )
			next_state <= S5;
		else if ( c < N)
			next_state <= S4;
		else
			next_state <= S7;
		
	end
	
	S7:begin
		//$display ("S7");
	end
	
	default:	next_state <= S0;
	endcase
end

// combinational logic to determine the output
always @(current_state)
begin 
	case(current_state)
	S0: O <= 0;
	S1: O <= 0;
	S2: O <= 0;
	S3: O <= 0;
	S4: O <= 0;
	S5:begin 
		O <= 1;
		DONE <= 1;
	end
	S6: O <= 0; 
	S7:begin
		O <= 0;
		DONE <= 1;
	end
	endcase
end
endmodule

