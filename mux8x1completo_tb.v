`timescale 1ns/1ns
`include "mux8x1completo.v"


module mux8x1_tb;

    reg sel0, sel1, sel2, enable;
    reg [3:0] a;
    reg [3:0] b;
    reg [3:0] c;
    reg [3:0] d;
    reg [3:0] e;
    reg [3:0] f;
    reg [3:0] g;
    reg [3:0] h;
    wire [3:0] out;


    mux_8x1_4bit uut(a, b, c, d, e, f, g, h, sel0, sel1, sel2, enable, out);


    initial begin
            
        $dumpfile("mux8x1_tb");
        $dumpvars(0, mux8x1_tb);

        // DECLARACION DE LOS VALORES QUE TENDRA CADA SALIDA
        a = 4'd15; b = 4'd1; c = 4'd2; d = 4'd15; e = 4'd4; f = 4'd5; g = 4'd15; h = 4'd7; enable = 1; 


        // ASIGNACION DE TODOS LOS ESTADOS DE SEL PARA TENER UNA PRUEBA COMPLETA, ESTANDO DURA 20ns
        {sel2, sel1, sel0} = 3'd0; #20;
        {sel2, sel1, sel0} = 3'd1; #20;
        {sel2, sel1, sel0} = 3'd2; #20;
        {sel2, sel1, sel0} = 3'd3; #20;
        {sel2, sel1, sel0} = 3'd4; #20;
        {sel2, sel1, sel0} = 3'd5; #20;
        {sel2, sel1, sel0} = 3'd6; #20;
        {sel2, sel1, sel0} = 3'd7; #20;


        $display("listo");
    end
endmodule