`timescale 1ns/1ps

module uart_rx_tb();

reg tb_clk = 1'b1;

wire tb_uart;

uart_tx txi (
    .clk(tb_clk),
    .en(1'b1),
    .data_in(8'haa),
    .dout(tb_uart)
);

uart_rx rxi (
    .clk(tb_clk),
    .din(tb_uart)
);

always
begin
    #5 tb_clk <= ~tb_clk;
end

endmodule