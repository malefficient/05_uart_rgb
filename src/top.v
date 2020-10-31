module top
(
    input wire          clk,
    output wire       dup_clk
 );
 
assign dup_clk = clk;
// TODO: generate a quarter-speed clock and output to qrtr_clk
// See https://www.beyond-circuits.com/wordpress/tutorial/tutorial1/ for relevant walkthrough
/*
always @(posedge clk)
begin
    rst_en <= 1'b0;
    if(rx_valid && rx_data == 8'h52)
    begin
        rst_en <= 1'b1;
    end
end
*/
endmodule
