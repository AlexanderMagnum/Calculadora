# Calculadora

a) Implementar el analizador léxico con Flex
    $ script.l

b) Implementar el analizador sintáctico con Bison. 
    $ script.y

c) Compilar bison con la opción –verbose y editar el fichero para ver el autómata LR. ¿Cuántos estados tiene? 
    $ bison -d script.y -v
    -> script.output
    -> Generó 47 estados.

d) Insertar las acciones semánticas necesarias para calcular el valor numérico de la expresión. 
    -> ecuaciones.txt

    5. Ejemplo 
    Ante la siguiente entrada 
    a =12+2*cos(3.14) ; 
    La salida debe ser: 
    El valor del identificador a es 10. 

    Los valores para seno, coseno y tangente están expresadas en radianes. 
    En los ejemplos se utilizan 180°, 45° y 60° en su respectiva conversion. 


e) Modificar la gramática para que se puedan reconocer una lista de asignaciones separadas por el punto y coma ; 
    -> ecuaciones.txt es un archivo ejecutable que permite la entrada de n cadenas para ser analizadas.
        Cada una está separadapor punto y coma ;

f ) Modificar la gramática para incluir el operador potencia (ˆ), las fun ciones raíz cuadrada, sqrt, la logaritmo natural ln y por último la función que calcula el reciproco de un número unosobrex. 
    -> La modificación etá en la gramática del analizador sintáctico y las reglas añadidas se encuentran en el analizador sintáctico.
    (script.l y script.y)

g) Haga el programa de tal manera que se incluya un archivo de en trada (que yo pueda modificar) donde se usen todas las funciones implementadas y un archivo de salida con los cálculos realizados co rrectamente. Si no quiere usar archivos, puede usar como archivo de entrada/salida a la terminal. 
    -> ./calculadora (Ejecuta el programa y recibe los argumentos desde la terminal).
    -> ./calculadora < ecuaciones.txt (Ejecuta el programa y toma el archivo .txt como entrada)
    -> ./calculadora < ecuaciones.txt > salida.txt (Ejecuta el programa y toma el archivo .txt como entrada y guarda la salida en el archivo salida.txt)

h) Incluya los scripts de entrada de Lex y Bison, el código fuente y el compilado de los analizadores generados así como un pequeño ins tructivo de uso. Incluya también, un instructivo donde se especifique como se generan los analizadores léxico y sintáctico dando con a Lex y Bison.
    
    -> Para generar en analizador sintactico.
    $ bison -d script.y         //Genera un fichero de c basado en el archivo de bison
    -> Ficheros generados: 
    Analizador C estandar: script.tab.c
    Cabecera del analizador c: script.tab.h

    -> Para generar en analizador léxico
    $ flex  -d script.l         //Genera un fichero de c basado en el archivo de lex
    -> Fichero generado: lex.yy.c

    Al ser archivos en C, se requiere un compilador de C estandar.

    $gcc lex.yy.c script.tab.c -o calculadora -lm -lfl

    genera el ejecutable del nombre asignado: calculadora
    (Ir al inciso g para ejecutar el programa según la opción deseada)
