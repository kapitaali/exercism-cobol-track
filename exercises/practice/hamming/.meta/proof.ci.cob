       IDENTIFICATION DIVISION.
       PROGRAM-ID. hamming.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       REPOSITORY. FUNCTION ALL INTRINSIC.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-DNA-1 PIC X(32).
       01 WS-DNA-2 PIC X(32).
       01 WS-HAMMING PIC 9(2).
       01 WS-DNA-INDEX PIC 9(5).
       01 WS-ERROR PIC X(31).

       PROCEDURE DIVISION.
       HAMMING.

       PERFORM VARYING WS-DNA-INDEX FROM 1 BY 1 
           UNTIL WS-DNA-INDEX > FUNCTION LENGTH(WS-DNA-1)
           
       IF FUNCTION LENGTH(TRIM(WS-DNA-1 TRAILING)) IS
           NOT EQUAL TO LENGTH(TRIM(WS-DNA-2 TRAILING))
           MOVE "Strands must be of equal length"
           TO WS-ERROR
           EXIT PERFORM
       END-IF

       IF WS-DNA-1 (WS-DNA-INDEX:1) IS EQUAL TO SPACE
           EXIT PERFORM CYCLE
       END-IF

       IF WS-DNA-1 (WS-DNA-INDEX:1) IS NOT
           EQUAL TO WS-DNA-2 (WS-DNA-INDEX:1)
           ADD 1 TO WS-HAMMING
       END-IF

       END-PERFORM.

      *DISPLAY "Hamming Distance is: " WS-HAMMING.
      *DISPLAY WS-ERROR.
