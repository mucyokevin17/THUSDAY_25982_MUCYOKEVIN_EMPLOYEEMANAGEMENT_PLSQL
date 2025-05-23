# 🚀 Employee Management System (EMS) - PL/SQL Capstone Project

<p align="center">
  <strong>Oracle Database Backend System for Payroll & HR Management</strong><br/>
  <em>Final GitHub Documentation | PDB: mon_231245_Mucyo_ems_db</em>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Database-Oracle19c-blue?logo=oracle" />
  <img src="https://img.shields.io/badge/Language-PL%2FSQL-yellow?logo=plsql" />
  <img src="https://img.shields.io/badge/Status-Completed-success" />
</p>

---

## 📌 Problem Statement (Phase 1)

Modern HR departments struggle with disorganized employee data, manual payroll calculations, and security issues around access and updates. This project solves these challenges with a normalized, auditable, and secure backend system using Oracle PL/SQL.

---

## 🧭 Methodology

The project was delivered in **8 phases**:

1. **Phase 1**: Identified problem, business use case, and stakeholders
2. **Phase 2**: Modeled business workflows (Swimlane/BPMN diagrams)
3. **Phase 3**: Designed ERD with normalization to 3NF
4. **Phase 4**: Created database schema and relations
5. **Phase 5**: Populated tables with realistic data
6. **Phase 6**: Developed procedures, functions, and cursors
7. **Phase 7**: Implemented triggers and audit logging for security
8. **Phase 8**: GitHub documentation and reporting

---

## 🧩 System Design & Diagrams

### 🖼️ Phase 2: Swimlane/BPMN Diagram

> 📸 **this is the  screenshot:**
> 
![image](https://github.com/user-attachments/assets/6e3cd778-7b43-4a23-bc27-aafbcad6b635)


### 📘 Phase 3: ERD

> 📸 ** this is the screenshot:**
>
> ![image](https://github.com/user-attachments/assets/6771b6f5-540e-4ac1-a76c-088c4ea2774e)


```
Entity Relationship Diagram showing employee, department, payroll, payslip, attendance, and holiday tables.
![image](https://github.com/user-attachments/assets/01d94846-36a6-4e3a-a335-e8c910e7989f)

```


---

## 📂 Folder Structure

```bash
mon_231245_Mucyo_ems_db/
├── SQL_Scripts/
│   ├── phase1_to_phase7.sql
├── Screenshots/
│   ├── swimlane_diagram.png
│   ├── ERD.png
│   ├── Procedure_Output.png
│   ├── Trigger_Error.png
│   ├── Audit_Log_Output.png
│   ├── Data_Insert_Success.png
│   ├── NetSalary_Output.png
├── Documentation/
│   ├── project_instructions.pdf
│   ├── phase1_ppt.pptx
└── README.md
```

---

## 🧠 Database Highlights by Phase And PDB Creaion 

### ✅ Phase 4: Schema Implementation
Ihave staterd by creating pluggable database as you see in the photo below 
![image](https://github.com/user-attachments/assets/6c417ada-5833-4fa6-9057-17a59c54d2e0)


And again also  I created user and assigned him previlleges as you see
![image](https://github.com/user-attachments/assets/df7841ce-2f3c-4243-aaa7-b170d8f5635d)

Testing perfomance of my database :

![image](https://github.com/user-attachments/assets/b22e8d23-8741-475a-9cc9-fe2c48191af3)




* Tables: `employee`, `department`, `payroll`, `payslip`, `holiday`, `attendance`
* Foreign keys, constraints, NOT NULL, UNIQUE columns

> 📸 **Optional Screenshot**: `Screenshots/schema_creation.png`

### ✅ Phase 5: Data Insertion
START BY CREATING TABLES :

 ![image](https://github.com/user-attachments/assets/3b70cfc6-e546-4329-bafb-bc071730ed55)
 ![image](https://github.com/user-attachments/assets/c0697205-8994-4165-9c01-5a1aa45e84ce)
 ![image](https://github.com/user-attachments/assets/844ac58a-d4ac-470f-9c08-67157945d3a2)

this is the out put of the created table :

* Inserted 10+ realistic rows per table
![image](https://github.com/user-attachments/assets/269c67c4-3afe-4a15-8445-c2cdfb60a53a)


> 📸
> Insert Data – employee
>
> ![image](https://github.com/user-attachments/assets/1104e382-88a7-4164-8951-cdecb9edd74f)
>
> OUT PUT:
>
> ![image](https://github.com/user-attachments/assets/0d39e15f-5a09-4c44-b939-2529a0b1d55f)
>
> Insert Data – attendance:
>
> ![image](https://github.com/user-attachments/assets/cfe46f16-0e12-4f4d-a964-fba88fffcebe)

OUT PUT:

   ![image](https://github.com/user-attachments/assets/79364f31-4aca-438e-8792-8b26a4162e0d)

Insert Data – payroll:

  ![image](https://github.com/user-attachments/assets/5c2eab31-c377-4a84-b98c-2304f0509ed0)

 OUT PUT :
 
  ![image](https://github.com/user-attachments/assets/ac79a1e2-d81a-42b6-ad74-44ebd1f241d2)

 Insert Data – payslip and ITS OUTPUT :

  ![image](https://github.com/user-attachments/assets/63dde9bb-ccb3-4fa0-9190-87b78750be99)


### ✅ Phase 6: PL/SQL Programming

* `get_employee_info()` procedure
* `calculate_net_salary()` function
* `payroll_pkg` package
* Cursor to loop through payroll

> 📸 Add:

* Procedure test output → `Screenshots/Procedure_Output.png`
* Net salary result → `Screenshots/NetSalary_Output.png`

### ✅ Phase 7: Security & Auditing

* `trg_restrict_dml`: Prevents DML on weekdays and public holidays
* `audit_log` table: Tracks every attempt

> 📸 Add:
>
> ![image](https://github.com/user-attachments/assets/86782c12-fc24-4b71-ac39-ab4df1dbefd0)
> ![image](https://github.com/user-attachments/assets/b94fe894-2eb5-455f-ad96-62dfe339da83)



* DML blocked by trigger → ``
* Query of `audit_log` →
*
* ![image](https://github.com/user-attachments/assets/493540d5-14a9-426f-b897-191973ecc01c)

`

---

## 📸 Summary of Screenshots to Include

| 📌 Phase | Screenshot                               | Filename                  |
| -------- | ---------------------------------------- | ------------------------- |
| Phase 2  | Swimlane diagram (draw\.io)              | `swimlane_diagram.png`    |
| Phase 3  | ERD                                      | `ERD.png`                 |
| Phase 5  | Data inserted confirmation               | `Data_Insert_Success.png` |
| Phase 6  | Procedure output (`get_employee_info`)   | `Procedure_Output.png`    |
| Phase 6  | Function result (`calculate_net_salary`) | `NetSalary_Output.png`    |
| Phase 7  | DML blocked (trigger error)              | `Trigger_Error.png`       |
| Phase 7  | Audit log content                        | `Audit_Log_Output.png`    |

---

## 💡 Core Features

* 👥 Employee CRUD with department links
* 🕒 Attendance tracking
* 💵 Payroll with dynamic net salary calculation
* 🧾 Payslip generation
* 🔐 Smart triggers blocking DML on weekdays & holidays
* 🛡️ Full audit log of all DML attempts

---

## 🧪 Sample PL/SQL Snippets

```sql
-- PROCEDURE
PROCEDURE get_employee_info(p_emp_id IN employee.employee_id%TYPE)

-- FUNCTION
FUNCTION calculate_net_salary(p_basic, p_overtime_hours, p_overtime_rate, p_deductions)

-- TRIGGER
BEFORE INSERT OR UPDATE OR DELETE ON employee
  IF weekday OR holiday THEN
    RAISE_APPLICATION_ERROR(...)
```

---

## 📋 How to Run

1. Clone the repository:

```bash
git clone https://github.com/yourusername/mon_231245_Mucyo_ems_db.git
```

2. Open `SQL_Scripts/` in Oracle SQL Developer
3. Run scripts in phase order (1 to 7)
4. Enable `DBMS_OUTPUT` for function/procedure results
5. Check screenshots folder for expected results

---

## 👨‍💻 Author

* **Name**: Mucyo Kevin
* **PDB**: `PLUGGABLE DATABASE THUSDAY_25982_MUCYOKEVIN_EMPLOYEEMANAGEMENT`
* **Email**: [mucyokevin17@gmail.com](mailto:mucyokevn17@gmail.com)
* **University**: Adventist University of Central Africa (AUCA)

---

## 📘 License

This project is licensed under the **MIT License** — free to use and modify for academic and professional purposes.

---

## 🏁 Final Word

> “I built this system not just to pass a course, but to simulate how a real company could manage HR & payroll operations — securely, efficiently, and with full traceability.”
