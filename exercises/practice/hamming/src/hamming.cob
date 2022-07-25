       IDENTIFICATION DIVISION.
       PROGRAM-ID. hamming.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-DNA-1 PIC X(32).
       01 WS-DNA-2 PIC X(32).
       01 WS-HAMMING PIC 9(2).
       01 WS-ERROR PIC X(31).

       PROCEDURE DIVISION.
       HAMMING.


       DISPLAY "Hamming Distance is: " WS-HAMMING.
       DISPLAY WS-ERROR.
