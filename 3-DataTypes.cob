           >>SOURCE FORMAT FREE
identification division.
program-id. 3-DataTypes.
author. Mauricio Rodriguez
date-written. 10/10/2017.
environment division.

data division.
working-storage section.
*> Define a variable of each type
*> and assign a value to it
*> and display it
01  var1 pic x value "A".
01  var2 pic 9 value 1.
01  var3 pic 9(3) value 123.
01  var4 pic 9(3)v99 value 123.45.
01  var5 pic 9 value 0.
       88  var5-88 value 1.
       88  var5-88 value 0.
01  var6 pic x value "0".
       88  var6-88 value "1" thru "9".

procedure division.
*> Display the values and its type
       display "var1: " var1 " type: alphanumeric".
       display "var2: " var2 " type: numeric".
       display "var3: " var3 " type: numeric with 3 digits".
       display "var4: " var4 " type: float with 2 decimals".
       display "var5: " var5 " type: boolean".
       display "var6: " var6 " type: alphanumeric with 0 thru 9".
stop run.

end program 3-DataTypes.
