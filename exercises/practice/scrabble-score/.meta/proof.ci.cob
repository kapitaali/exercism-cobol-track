       IDENTIFICATION DIVISION.
       PROGRAM-ID. SCRABBLE-SCORE.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *Inputs
       01 WS-WORD   PIC X(60).
       01 WS-LETTERS REDEFINES WS-WORD.
        02 WS-LETTER PIC X OCCURS 60 TIMES
         INDEXED BY LETTER-INDEX.
        88 TEN-POINTER VALUES 'Q','Z'.
        88 EIGHT-POINTER VALUES 'J','X'.
        88 FIVE-POINTER VALUES 'K'.
        88 FOUR-POINTER VALUES 'F','H','V','W','Y'.
        88 THREE-POINTER VALUES 'B','C','M','P'.
        88 TWO-POINTER VALUES 'D','G'.
        88 ONE-POINTER VALUES 'A','E','I','O','U','L','N','R','S','T'.
      *Outputs
       01 WS-RESULT PIC 99.
      *Working
       01 TEN-POINTS   CONSTANT 10.
       01 EIGHT-POINTS CONSTANT 8.
       01 FIVE-POINTS  CONSTANT 5.
       01 FOUR-POINTS  CONSTANT 4.
       01 THREE-POINTS CONSTANT 3.
       01 TWO-POINTS   CONSTANT 2.
       01 ONE-POINTS   CONSTANT 1.
       01 WS-UPPER-CASE PIC X(26) VALUE 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.
       01 WS-LOWER-CASE PIC X(26) VALUE 'abcdefghijklmnopqrstuvwxyz'.

       PROCEDURE DIVISION.
       SCRABBLE-SCORE.
        MOVE ZEROES TO WS-RESULT.
      * Uppercase the word
        INSPECT WS-WORD
         CONVERTING WS-LOWER-CASE to WS-UPPER-CASE.
        SET LETTER-INDEX TO 1.
        PERFORM UNTIL WS-LETTER(LETTER-INDEX) = SPACE
         IF TEN-POINTER(LETTER-INDEX)
          ADD TEN-POINTS TO WS-RESULT
         END-IF
         IF EIGHT-POINTER(LETTER-INDEX)
          ADD EIGHT-POINTS TO WS-RESULT
         END-IF
         IF FIVE-POINTER(LETTER-INDEX)
          ADD FIVE-POINTS TO WS-RESULT
         END-IF
         IF FOUR-POINTER(LETTER-INDEX)
          ADD FOUR-POINTS TO WS-RESULT
         END-IF
         IF THREE-POINTER(LETTER-INDEX)
          ADD THREE-POINTS TO WS-RESULT
         END-IF
         IF TWO-POINTER(LETTER-INDEX)
          ADD TWO-POINTS TO WS-RESULT
         END-IF
         IF ONE-POINTER(LETTER-INDEX)
          ADD ONE-POINTS TO WS-RESULT
         END-IF

         SET LETTER-INDEX UP BY 1
        END-PERFORM.