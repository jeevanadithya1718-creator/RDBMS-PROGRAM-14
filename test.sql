-- Test file for Question 14

SET SERVEROUTPUT ON;

DECLARE
    num1 NUMBER := 10;
    num2 NUMBER := 20;
    total NUMBER;
BEGIN
    total := num1 + num2;

    IF total = 30 THEN
        DBMS_OUTPUT.PUT_LINE('TEST PASSED');
    ELSE
        DBMS_OUTPUT.PUT_LINE('TEST FAILED');
    END IF;
END;
/
