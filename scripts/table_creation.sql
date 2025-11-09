-- employee table
CREATE TABLE my_employees (
    emp_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    salary NUMBER,
    rating VARCHAR2(5)
);

-- bonus table
CREATE TABLE my_bonus_log (
    emp_id NUMBER,
    bonus NUMBER
);

-- Data for testing
INSERT INTO my_employees VALUES (1, 'John', 50000, 'A');
INSERT INTO my_employees VALUES (2, 'Sarah', 0, 'B');      -- Zero salary
INSERT INTO my_employees VALUES (3, 'Mike', 60000, 'A');

COMMIT;