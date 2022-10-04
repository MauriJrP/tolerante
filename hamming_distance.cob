      * ----------------------------------------------------------------------
      * exercism.io
      * COBOL Track Exercise: hamming
      * Contributed: Anthony J. Borla (ajborla@bigpond.com)
      * ----------------------------------------------------------------------
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HAMMING.
       DATA DIVISION.
      *
       WORKING-STORAGE SECTION.
       01 WS-DNA-1                PIC X(32) VALUE SPACES.
       01 WS-DNA-1-TABLE          REDEFINES WS-DNA-1.
          05 WS-DNA-1-VALUE       PIC X(01)
                                  OCCURS 32 TIMES.
      *
       01 WS-DNA-2                PIC X(32) VALUE SPACES.
       01 WS-DNA-2-TABLE          REDEFINES WS-DNA-2.
          05 WS-DNA-2-VALUE       PIC X(01)
                                  OCCURS 32 TIMES.
      *
       01 WS-HAMMING              PIC 9(02) VALUE ZEROES.
       01 WS-ERROR                PIC X(31) VALUE SPACES.
      *
       01 WS-SCRATCHPAD.
          05 WS-DNA-1-LENGTH      PIC 9(02).
          05 WS-DNA-2-LENGTH      PIC 9(02).
          05 WS-DNA-IDX           PIC 9(02).
      *
       PROCEDURE DIVISION.
      *
       HAMMING.
           COMPUTE WS-DNA-1-LENGTH =
             FUNCTION LENGTH(FUNCTION TRIM(WS-DNA-1))
      *
           COMPUTE WS-DNA-2-LENGTH =
             FUNCTION LENGTH(FUNCTION TRIM(WS-DNA-2))
      *
           IF WS-DNA-1-LENGTH <> WS-DNA-2-LENGTH THEN
             MOVE 'Strands must be of equal length' TO WS-ERROR
             EXIT PARAGRAPH
           END-IF
      *
           IF WS-DNA-1-LENGTH < 1 THEN
             MOVE ZEROES TO WS-HAMMING
             EXIT PARAGRAPH
           END-IF
      *
           MOVE FUNCTION TRIM(WS-DNA-1) TO WS-DNA-1
           MOVE FUNCTION TRIM(WS-DNA-2) TO WS-DNA-2
      *
           MOVE ZEROES TO WS-HAMMING
           PERFORM VARYING WS-DNA-IDX FROM 1 BY 1 
                   UNTIL WS-DNA-IDX > WS-DNA-1-LENGTH
             IF WS-DNA-1-VALUE(WS-DNA-IDX) <> WS-DNA-2-VALUE(WS-DNA-IDX) THEN
               ADD 1 TO WS-HAMMING
             END-IF
           END-PERFORM.
      *