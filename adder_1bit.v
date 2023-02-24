module adder(a ,b , cin, out, cout);
    // ESTE MODULO CREA UN SUMADOR DE UN SOLO DOS BIT


    // ENTRADA DE NUM 1 Y NUM, PERO TIENE UN ACARREO DE ENTRADA
    input a, b, cin;

    // SALIDA DE LA SUMA DEL NUM Y UN ACARREO DE SALIDA
    output out, cout;


    // DOS WIRE QUE SE NECESITAN PARA CREAR EL MODELO ESTRUCTURAL DEL SUMADOR
    wire and1, or1;


    // LOGICA COMBINANCIONAL DEL SUMADOR 
    assign and1 = a & b;
    assign or1 = a ^ b;

    assign out = or1 ^ cin;
    assign cout = and1 | ( or1 & cin );


endmodule