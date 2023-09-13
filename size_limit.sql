list @aws_stage;

create or replace stage aws_stage
url='s3://snowflakebucket-copyoption/size/';

select * from orders;

copy into orders
from @aws_stage
file_format=(format_name=ass_file)
size_limit=20000;

create or replace table orders(
ORDER_ID STRING,
AMOUNT STRING,
PROFIT INT,
QUANTITY INT,
CATEGORY VARCHAR(30),
SUBCATEGORY VARCHAR(30)
);

copy into orders
from @aws_stage
file_format=(format_name=ass_file)
size_limit=60000;