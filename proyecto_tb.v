`timescale 1ns/1ns
`include "proyecto.v"



module proyecto_tb;

    
    reg sel0, sel1, sel2;
    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    wire cout;
    wire [3:0] out;


    ALU uut(a, b, cin, sel0, sel1, sel2, out, cout);


    initial begin
            
        $dumpfile("proyecto_tb");
        $dumpvars(0, proyecto_tb);

        // DECLARACION DE LOS VALORES QUE TENDRA CADA SALIDA
        a = 4'd8; b = 4'd12; cin =1;
        


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