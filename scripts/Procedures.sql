-- Collection 
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE demo_collections IS
    TYPE salary_list IS VARRAY(3) OF NUMBER;
    salaries salary_list := salary_list(50000, 45000, 60000);
    total NUMBER := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== COLLECTIONS ===');
    FOR i IN 1..salaries.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Salary ' || i || ': $' || salaries(i));
        total := total + salaries(i);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Total: $' || total);
END;
/

EXEC demo_collections;

-- Records
CREATE OR REPLACE PROCEDURE demo_records IS
    TYPE emp_rec IS RECORD (
        id NUMBER,
        name VARCHAR2(50),
        salary NUMBER
    );
    employee emp_rec;
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== RECORDS ===');
    employee.id := 1;
    employee.name := 'John';
    employee.salary := 50000;
    DBMS_OUTPUT.PUT_LINE('ID: ' || employee.id);
    DBMS_OUTPUT.PUT_LINE('Name: ' || employee.name);
    DBMS_OUTPUT.PUT_LINE('Salary: $' || employee.salary);
END;
/

EXEC demo_records;

-- Goto Statements
CREATE OR REPLACE PROCEDURE demo_goto IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== GOTO ===');
    FOR e IN (SELECT * FROM my_employees) LOOP
        IF e.salary = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Skipping ' || e.name || ' - zero salary');
            GOTO next_emp;
        END IF;
        DBMS_OUTPUT.PUT_LINE('Processing ' || e.name || ' - Salary: $' || e.salary);
        INSERT INTO my_bonus_log VALUES (e.emp_id, e.salary * 0.10);
        <<next_emp>>
        NULL;
    END LOOP;
    COMMIT;
END;
/

EXEC demo_goto;