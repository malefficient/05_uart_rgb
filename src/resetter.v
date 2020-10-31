module resetter (
    input wire  clk,
    input wire  rst,
    output wire rst_out
);

reg [15:0] shreg;
assign rst_out = shreg[0];

always @(posedge clk)
begin
    shreg <= {1'b1, shreg[15:1]};
    if(rst)
    begin
        shreg <= 16'd0;
    end
end

endmodule