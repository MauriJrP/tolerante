           >>SOURCE FORMAT FREE
identification division.
*> Program to check if user is adult or not.
program-id. 5-Conditionals.

environment division.


data division.

working-storage section.
01  age pic 99.
01  adult pic x(5) value "adult".
01  minor pic x(5) value "minor".


procedure division.
main-logic.
display "Enter your age".
accept age.
if age >= 18
display adult
else
display minor


stop run.
end program 5-Conditionals.
