A = LOAD '/project/pig/employee_details.txt' USING PigStorage(',') AS (emp_id:int, emp_name:chararray,emp_salary:int,  emp_rating:int);
B = order A by emp_rating desc;
C = limit B 5 ;     
D = foreach C generate emp_id,emp_name,emp_rating;
E = group  D by emp_rating;
dump E;