emp = LOAD '/project/pig/employee_details.txt' USING PigStorage(',') AS (emp_id:int, emp_name:chararray, emp_salary:int);
emp_expenses = LOAD '/project/pig/employee_expenses.txt' AS (emp_id:int, expenses:int);
joined_data = join emp by emp_id , emp_expenses by emp_id;
A = foreach joined_data generate emp::emp_id , emp::emp_name , emp_expenses::expenses;
B = group joined_data by emp_expenses::expenses ;
C = order B by group desc ;
D = limit C 1;
dump D;