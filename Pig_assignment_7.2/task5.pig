emp = LOAD '/project/pig/employee_details.txt' USING PigStorage(',') AS (emp_id:int, emp_name:chararray, emp_salary:int);
emp_expenses = LOAD '/project/pig/employee_expenses.txt' AS (emp_id:int, expenses:int);
joined_data = join emp by emp_id left outer, emp_expenses by emp_id;
filter_data = filter joined_data by $4 IS NULL ; 
A = foreach filter_data generate emp::emp_id, emp::emp_name ;
dump A;