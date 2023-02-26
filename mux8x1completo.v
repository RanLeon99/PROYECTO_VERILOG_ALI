`include "mux8x1de1bit.v"


module mux_8x1_4bit(a, b, c, d, e, f, g, h, sel0, sel1, sel2, enable, out);


        // ESTE MODULO INSTANCIA EL MUX8X1 DE UN SOLO BIT PARA CREAR UNO QUE TRABAJA CON UN BUS DE 4 BIT

        input sel0, sel1, sel2, enable;  //ENTRADAS DE SELECCION Y ENABLE
        //ENTRADAS DEL MUX, TODAS SON UN BUS DE 4BIT
        input  [3:0] a;
        input  [3:0] b;
        input [3:0] c;
        input [3:0] d;
        input [3:0] e;
        input [3:0] f;
        input [3:0] g;
        input [3:0] h;
        //SALIDA DEL MUX QUE ES UN BUS DE 4BIT
        output [3:0] out;

    // SE LLAMA 4 VECES EL MUX 8X1 DE UN BIT PARA QUE HAGA EL ANALISIS DE CADA UNO DE LOS BIT
    // YA QUE SE VA A TRABAJAR CON BUSES DE 4
    // INSTANCIACION POR DESPCION POSICIONAL
    mux_8x1 mux_0 ((a[0]), (b[0]), (c[0]), (d[0]), (e[0]), (f[0]), (g[0]), (h[0]), sel0, sel1, sel2, enable, (out[0]));
    mux_8x1 mux_1 ((a[1]), (b[1]), (c[1]), (d[1]), (e[1]), (f[1]), (g[1]), (h[1]), sel0, sel1, sel2, enable, (out[1]));
    mux_8x1 mux_2 ((a[2]), (b[2]), (c[2]), (d[2]), (e[2]), (f[2]), (g[2]), (h[2]), sel0, sel1, sel2, enable, (out[2]));
    mux_8x1 mux_3 ((a[3]), (b[3]), (c[3]), (d[3]), (e[3]), (f[3]), (g[3]), (h[3]), sel0, sel1, sel2, enable, (out[3]));

endmodule