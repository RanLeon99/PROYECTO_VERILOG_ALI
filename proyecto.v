`include "adder_1bit.v"
`include "mux8x1completo.v"



/* 
    OPICIONE DE LA ALU

    SEL2 - SEL1 - SEL0

    0 - 0 - 0 = SUMADOR
    0 - 0 - 1 = AND
    0 - 1 - 0 = OR
    0 - 1 - 1 = NAND
    1 - 0 - 0 = NOR

    1 - 0 - 1 = CONECTADAS A TIERRA
    1 - 1 - 0 =  CONECTADAS A TIERRA
    1 - 1 - 1 = CONECTADAS A TIERRA

*/


module ALU (a, b, cin, sel0, sel1, sel2, out, cout);


    // SE CREAN 6 ENTRADAS
    // TRES SON DE SELECCION, QUE SON DE UN BIT
    // UN ACARREO DE ENTRADA, QUE ES DE UN BIT
    // DOS ENTRADAS, QUE SON DE 4 BIT'S
    input [3:0] a;
    input [3:0] b;
    input cin;
    input sel0, sel1, sel2;

    // SALIDA DEL MUX, QUE ES DE 4 BIT'S
    //SALIDA DEL ACARREO DE SALIDA
    output cout;
    output [3:0] out;

    // SE CREAN LOS WIRE NECESARIO PARA LLEVAR LOS RESULTADOS DE LAS DIFERENTES OPCIONES
    wire [3:0] s_out;
    wire [3:0] and_out;
    wire [3:0] or_out;
    wire [3:0] nand_out;
    wire [3:0] nor_out;

    // SE CREAN WIRE QUE SIRVEN COMO LOS ACARREO DE ENTRADA Y SALIDA ENTRE CADA SUMADOR
    wire cin1, cin2, cin3;
    // SE CREAN 3 VARIABLES, ESTA SE USAN PARA LAS ENTRADAS DEL MUX QUE NO SE NECESITAN 
    wire [3:0] salida_6;
    wire [3:0] salida_7;
    wire [3:0] salida_5;



    // SE CREA EL SUMADOR COMPLETO DE LOS 4 BIT, LLAMANDO AL SUMADOR DE UN BIT
    adder adder_bit0 ( (a[0]), (b[0]), (cin), (s_out[0]), (cin1) );
    adder adder_bit1 ( (a[1]), (b[1]), (cin1), (s_out[1]), (cin2) );
    adder adder_bit2 ( (a[2]), (b[2]), (cin2), (s_out[2]), (cin3) );
    adder adder_bit3 ( (a[3]), (b[3]), (cin3), (s_out[3]), (cout) );



    // A LAS ENYTRADAS DEL MUX QUE NO SE USAN SE LES PONE UN CERO
    assign salida_5 = 4'd0;
    assign salida_6 = 4'd0;
    assign salida_7 = 4'd0;

    // SE CREAN LAS OPERACIONES DE AND. OR .... 
    assign and_out = a & b;
    assign or_out = a | b;
    assign nand_out = ~(a & b);
    assign nor_out = ~(a|b);


    // SE LE COLOCA LOS RESULTADOS DE LAS DIFERENTES OPERACIONES A LAS ENTRADAS DEL MUX

    mux_8x1_4bit mux(s_out, and_out, or_out, nand_out, nor_out, salida_5, salida_6, salida_7, sel0, sel1, sel2, out);

endmodule

