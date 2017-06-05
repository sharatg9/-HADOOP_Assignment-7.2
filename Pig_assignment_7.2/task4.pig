emp = LOAD '/project/pig/employee_details.txt' USING PigStorage(',') AS (emp_id:int, emp_name:chararray, emp_salary:int);
emp_expenses = LOAD '/project/pig/employee_expenses.txt' AS (emp_id:int, expenses:int);
joined_data = join emp by emp_id right outer, emp_expenses by emp_id;
filter_data = filter joined_data by $0 IS NOT NULL;
A = foreach  filter_data generate emp::emp_id, emp::emp_name ;
B = distinct A ;
dump B;
