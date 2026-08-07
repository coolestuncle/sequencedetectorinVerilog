module sequence_detector(
    input clk,
    input data,
    input reset,
    output out
);

reg [3:0] seq, next_seq;
reg out_next;

always @(*) begin 
    case(seq)
    4'b0000 : next_seq = (data == 1) ? 4'b0001 : 4'b0000;
    4'b0001 : next_seq = (data == 0) ? 4'b0010 : 4'b0001;
    4'b0010 : next_seq = (data == 0) ? 4'b0100 : 4'b0001;
    4'b0100 : next_seq = (data == 1) ? 4'b1001 : 4'b0000;

    4'b1001 : next_seq = (data == 0) ? 4'b0010 : 4'b0001;

    default : next_seq = 4'b0000;
    endcase
end

always @(posedge clk, posedge reset) begin
    if (reset) begin
        seq <= 4'b0000;
        out_next <= 0;
    end
    else if (next_seq == 4'b1001) begin
        out_next <= 1;
        seq <= next_seq;
    end
    else begin
        out_next <= 0;
        seq <= next_seq;
    end
end

assign out = out_next;

endmodule