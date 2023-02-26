module mux_8x1(a, b, c, d, e, f, g, h, sel0, sel1, sel2, enable, out);

        // ESTE MODULO CREA UN MUX DE SOLO UN BIT DE ENTRADA Y SALIDA, ES UN MUX DE 8X1

        // TIENE UNA ENTRADA DE ENABLE, QUE TRABAJA CON LOGICA NEGAATIVA
        // ENABLE = 0 --> TRABAJA BIEN EL MUX
        //ENABLE =  --> APAGADO EL MUX

        input sel0, sel1, sel2,enable; //ENTRADAS DE SELECCION Y ENABLE
        //ENTRADAS DEL MUX 
        input  a;
        input  b;
        input  c;
        input  d;
        input  e;
        input  f;
        input  g;
        input  h;
        //SALIDA DEL MUX
        output out;

// wire para crear todas las and's de todas las entradas
// cada entrada necesita dos and's
        wire out_ina0; 
        wire out_ina1; 
        wire out_ina2;
        wire out_inaen;

        wire out_inb0; 
        wire  out_inb1; 
        wire  out_inb2;
        wire  out_inben;

        wire  out_inc0;
        wire  out_inc1; 
        wire  out_inc2;
        wire  out_incen;

        wire  out_ind0; 
        wire  out_ind1; 
        wire  out_ind2;
        wire  out_inden;

        wire  out_ine0;
        wire  out_ine1;
        wire  out_ine2;
        wire  out_ineen;

        wire  out_inf0; 
        wire  out_inf1; 
        wire  out_inf2;
        wire  out_infen;

        wire  out_ing0; 
        wire  out_ing1; 
        wire  out_ing2;
        wire  out_ingen;

        wire  out_inh0; 
        wire  out_inh1;
        wire  out_inh2;
        wire  out_inhen;


        // or's para craer la salida final
        wire  or_ab;
        wire  or_abc;
        wire  or_abcd;
        wire  or_abcde;
        wire  or_abcdef; 
        wire  or_abcdefg;



        // and para generar la entrada a
        assign out_ina0 =  a & ~sel0;
        assign out_ina1 =  ~sel1 & ~sel2;
        assign out_inaen = out_ina1 & ~enable;
        assign out_ina2 = out_ina0 & out_inaen;    // usar esta en la or


        // and para generar la entrada b
        assign out_inb0 = b & sel0;
        assign out_inb1 = ~sel1 & ~sel2;
        assign out_inben = out_inb1 & ~enable;
        assign out_inb2 =  out_inb0 & out_inben;   // usar esta en la or

        // and para generar la entrada c
        assign out_inc0 = c & ~sel0;
        assign out_inc1 = sel1 & ~sel2;
        assign out_incen = out_inc1 & ~enable;
        assign out_inc2 = out_inc0 & out_incen;   // usar esta en la or


        // and para generar la entrada d
        assign out_ind0 = d & sel0;
        assign out_ind1 = sel1 & ~sel2;
        assign out_inden = out_ind1 & ~enable;
        assign out_ind2 = out_ind0 & out_inden;       // usar esta en la or

        // and para generar la entrada e
        assign out_ine0 = e & ~sel0;
        assign out_ine1 = ~sel1 & sel2;
        assign out_ineen = out_ine1 & ~enable;
        assign out_ine2 = out_ine0 & out_ineen;       // usar esta en la or


        // and para generar la entrada f
        assign out_inf0 = f & sel0;
        assign out_inf1 = ~sel1 & sel2;
        assign out_infen = out_inf1 & ~enable;
        assign out_inf2 = out_inf0 & out_infen;       // usar esta en la or


        // and para generar la entrada g
        assign out_ing0 = g & ~sel0;
        assign out_ing1 = sel1 & sel2;
        assign out_ingen = out_ing1 & ~enable;
        assign out_ing2 = out_ing0 & out_ingen;       // usar esta en la or


        // and para generar la entrada h
        assign out_inh0 = h & sel0;
        assign out_inh1 = sel1 & sel2;
        assign out_inhen = out_inh1 & ~enable;
        assign out_inh2 = out_inh0 & out_inhen;       // usar esta en la or

        // se hace la or de todas las and de salida de cada entrada
        assign or_ab = out_ina2 | out_inb2;
        assign or_abc = or_ab | out_inc2;
        assign or_abcd = or_abc | out_ind2;
        assign or_abcde = or_abcd | out_ine2;
        assign or_abcdef = or_abcde | out_inf2;
        assign or_abcdefg = or_abcdef | out_ing2;
        assign out = or_abcdefg | out_inh2;   


endmodule