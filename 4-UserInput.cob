           >>SOURCE FORMAT FREE
identification division.
program-id. 4-UserInput.
author. Mauricio Rodriguez.
date-written. 10/10/2018.
environment division.

data division.
working-storage section.
01  myName pic x value space.
01  firstName pic x(25) value spaces.
01  lastName pic x(25) value spaces.
01  Age pic 99 value 0.
01  Gender pic x(6) value spaces.

procedure division.
       display "Enter your first name: " with no advancing .
       accept firstName.
       display "Enter your last name: ".
           accept lastName.
       display "Enter your age: ".
           accept Age.
       display "Enter your gender: ".
           accept Gender.
       display "Your name is: " firstName " " lastName.
       display "Your age is: " Age.
       display "Your gender is: " Gender.

stop run.

end program 4-UserInput.


*>            >>SOURCE FORMAT FREE
*> identification division.
*> program-id. 4-UserInput.
*> author. Mauricio Rodriguez.
*> date-written. 10/10/2018.
*> environment division.

*> data division.
*> working-storage section.
*> 01  myInput.
*>     05  myName.
*>         10  firstName pic x value "a".
*>         10  lastName pic x value "a".
*>     05  Age pic 99 value 0.
*>     05  Gender pic x(6) value "a".

*> procedure division.
*>        display "Enter your first name: ".
*>            accept myInput.myName.firstName.
*>        display "Enter your last name: ".
*>            accept myInput.myName.lastName.
*>        display "Enter your age: ".
*>            accept myInput.Age.
*>        display "Enter your gender: ".
*>            accept myInput.Gender.
*>        display "Your name is: " myInput.myName.firstName " " myInput.myName.lastName.
*>        display "Your age is: " myInput.Age.

*> stop run.

*> end program 4-UserInput.
