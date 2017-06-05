A = LOAD '/project/pig/employee_details.txt' USING PigStorage(',') AS (emp_id:int, emp_name:chararray,emp_salary:int,  emp_rating:int);
B = filter A BY emp_id % 2 == 1 ;
C = foreach B generate emp_id,emp_name,emp_salary;
D = order C by emp_salary desc;
E =limit D 3;
dump E;