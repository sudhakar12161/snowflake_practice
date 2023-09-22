create or replace table employees(
customer_id int,
first_name varchar(50),
last_name varchar(50),
email varchar(50),
age int,
department varchar(50)
);

create or replace stage aws_ass_stage
url='s3://snowflake-assignments-mc/copyoptions/example2';

create or replace file format ass_file_format
type='csv'
field_delimiter=','
skip_header = 1;

list @aws_ass_stage;

copy into employees
from @aws_ass_stage
file_format=(format_name=ass_file_format)
validation_mode=return_errors;

copy into employees
from @aws_ass_stage
file_format=(format_name=ass_file_format)
truncatecolumns=true;
