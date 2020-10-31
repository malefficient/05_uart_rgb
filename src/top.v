module top
(
    input wire          clk,
    input wire          ftdi_rx,
    output wire         ftdi_tx,
    input wire          board_rx,
    output wire         board_tx,
    output wire         board_rst,
    output reg          led = 1'b1,
    output wire [13:0]  debug_header
);

// Combinatorial logic
assign board_tx = ftdi_rx;
assign ftdi_tx = board_rx;

wire rx_valid;
wire [7:0] rx_data;

uart_rx rxi (
    .clk(clk),
    .din(ftdi_rx),
    .data_out(rx_data),
    .valid(rx_valid)
);

reg rst_en;

resetter rsti (
    .clk(clk),
    .rst(rst_en),
    .rst_out(board_rst)
);

always @(posedge clk)
begin
    rst_en <= 1'b0;
    if(rx_valid && rx_data == 8'h52)
    begin
        rst_en <= 1'b1;
    end
end

endmodule
