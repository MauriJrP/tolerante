       >>SOURCE FORMAT FREE
identification division.
program-id. hamming.
author. Mauricio Rodriguez.
date-written. 03/10/2022.
environment division.

data division.
working-storage section.
*> Define variables
01 ws-opt pic 9(1) value 1.
       88 ws-opt-1 value 1.
       88 ws-opt-2 value 2.
       88 ws-opt-3 value 3.
       88 ws-opt-4 value 4.

01  hour pic 99.

01 WS-DNA-1                PIC X(32) VALUE SPACES.
01 WS-DNA-1-TABLE          REDEFINES WS-DNA-1.
   05 WS-DNA-1-VALUE       PIC X(01)
                           OCCURS 32 TIMES.

procedure division.

0000-MAIN.
       display "Program starts"
       perform 0100-MENU until ws-opt = 4.
       stop run.
       
0050-GENERATE-RANDOM-NUMBER.
       accept hour from time
       display hour.

0100-MENU.
       display "1) Generar cadena valida"
       display "2) Generar cadena con errores"
       display "3) Verificar cadena"
       display "4) Salir"
       accept ws-opt
       evaluate true
           when ws-opt = 1
               perform 0200-GENERATE-VALID-STRING
           when ws-opt = 2
               perform 0300-GENERATE-INVALID-STRING
           when ws-opt = 3
               perform 0400-VERIFY-STRING
           when ws-opt = 4
               display "Saliendo..."
           when other
               display "Opcion invalida"
       end-evaluate.

0200-GENERATE-VALID-STRING.
       display "Generando cadena valida...".
       display "Cadena generada: ".

0300-GENERATE-INVALID-STRING.
       display "Generando cadena con errores...".
       display "Cadena generada: ".

0400-VERIFY-STRING.
       display "Verificando cadena...".
       display "Cadena verificada: ".


