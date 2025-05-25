-- ✅ PHASE 4: CREATE TABLES

CREATE TABLE department (
    department_id NUMBER PRIMARY KEY,
    department_name VARCHAR2(50) NOT NULL
);

CREATE TABLE employee (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    gender VARCHAR2(10),
    email VARCHAR2(100),
    phone VARCHAR2(20),
    hire_date DATE,
    job_title VARCHAR2(50),
    department_id NUMBER REFERENCES department(department_id),
    basic_salary NUMBER,
    status VARCHAR2(20),
    national_id VARCHAR2(25)
);

CREATE TABLE attendance (
    attendance_id NUMBER PRIMARY KEY,
    employee_id NUMBER REFERENCES employee(employee_id),
    check_in DATE,
    check_out DATE,
    status VARCHAR2(20)
);

CREATE TABLE holiday (
    holiday_id NUMBER PRIMARY KEY,
    holiday_date DATE UNIQUE,
    description VARCHAR2(100)
);

CREATE TABLE payroll (
    payroll_id NUMBER PRIMARY KEY,
    employee_id NUMBER REFERENCES employee(employee_id),
    pay_date DATE,
    basic_salary NUMBER,
    overtime_hours NUMBER,
    overtime_rate NUMBER,
    deductions NUMBER,
    net_salary NUMBER,
    is_paid CHAR(1)
);

CREATE TABLE payslip (
    payslip_id NUMBER PRIMARY KEY,
    payroll_id NUMBER REFERENCES payroll(payroll_id),
    generated_date DATE,
    payment_method VARCHAR2(30),
    remarks VARCHAR2(100)
);

CREATE TABLE audit_log (
    log_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id VARCHAR2(30),
    action_type VARCHAR2(20),
    table_name VARCHAR2(30),
    action_date DATE,
    action_status VARCHAR2(10)
);

-- ✅ PHASE 5: INSERT SAMPLE DATA
-- Add department data
INSERT INTO department VALUES (1, 'Finance');
INSERT INTO department VALUES (2, 'HR');
INSERT INTO department VALUES (3, 'IT');

-- Add employees (national_id added later)
INSERT INTO employee VALUES (102, 'Alice', 'Uwase', 'Female', 'alice@ems.com', '0788123456', TO_DATE('2023-03-01','YYYY-MM-DD'), 'Accountant', 1, 500000, 'Active', NULL);
INSERT INTO employee VALUES (103, 'James', 'Kamanzi', 'Male', 'james@ems.com', '0788345678', TO_DATE('2022-01-15','YYYY-MM-DD'), 'HR Officer', 2, 450000, 'Active', NULL);
-- Add more employees as needed...

-- Add holidays
INSERT INTO holiday VALUES (1, TO_DATE('2025-01-01','YYYY-MM-DD'), 'New Year');
INSERT INTO holiday VALUES (2, TO_DATE('2025-07-01','YYYY-MM-DD'), 'Independence Day');

-- Add attendance
INSERT INTO attendance VALUES (1, 102, SYSDATE - 1, SYSDATE, 'Present');
INSERT INTO attendance VALUES (2, 103, SYSDATE - 1, SYSDATE, 'Present');

-- Add payroll data
INSERT INTO payroll VALUES (1, 102, SYSDATE, 500000, 5, 2500, 20000, 492500, 'Y');
-- Add more payroll rows...

-- Add payslip
INSERT INTO payslip VALUES (1, 1, SYSDATE, 'Bank Transfer', 'Monthly salary');

-- ✅ PHASE 6: PROCEDURE, FUNCTION
CREATE OR REPLACE PROCEDURE get_employee_info(p_emp_id IN employee.employee_id%TYPE) IS
  v_fname employee.first_name%TYPE;
  v_lname employee.last_name%TYPE;
  v_email employee.email%TYPE;
  v_status employee.status%TYPE;
BEGIN
  SELECT first_name, last_name, email, status
  INTO v_fname, v_lname, v_email, v_status
  FROM employee
  WHERE employee_id = p_emp_id;

  DBMS_OUTPUT.PUT_LINE('Name: ' || v_fname || ' ' || v_lname);
  DBMS_OUTPUT.PUT_LINE('Email: ' || v_email);
  DBMS_OUTPUT.PUT_LINE('Status: ' || v_status);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Employee not found.');
END;
/

CREATE OR REPLACE FUNCTION calculate_net_salary(
  p_basic_salary IN NUMBER,
  p_overtime_hours IN NUMBER,
  p_overtime_rate IN NUMBER,
  p_deductions IN NUMBER
) RETURN NUMBER IS
  v_net_salary NUMBER;
BEGIN
  v_net_salary := p_basic_salary + (p_overtime_hours * p_overtime_rate) - p_deductions;
  RETURN v_net_salary;
END;
/

-- ✅ PHASE 7: TRIGGERS & AUDITING
CREATE OR REPLACE TRIGGER trg_restrict_dml
BEFORE INSERT OR UPDATE OR DELETE ON employee
FOR EACH ROW
DECLARE
    v_day VARCHAR2(10);
    v_today DATE := TRUNC(SYSDATE);
    v_holiday_found NUMBER := 0;
BEGIN
    SELECT TRIM(TO_CHAR(SYSDATE, 'DAY')) INTO v_day FROM DUAL;
    v_day := UPPER(v_day);

    IF v_day IN ('MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY') THEN
        RAISE_APPLICATION_ERROR(-20001, 'DML operations are restricted on weekdays.');
    END IF;

    SELECT COUNT(*) INTO v_holiday_found
    FROM holiday
    WHERE holiday_date = v_today;

    IF v_holiday_found > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'DML operations are restricted on public holidays.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_log_dml_success
AFTER INSERT OR UPDATE OR DELETE ON employee
DECLARE
    v_event VARCHAR2(20);
BEGIN
    v_event := ORA_SYSEVENT;
    INSERT INTO audit_log(user_id, action_type, table_name, action_date, action_status)
    VALUES (USER, v_event, 'EMPLOYEE', SYSDATE, 'ALLOWED');
END;
/
