create or replace stage aws_stage
url='s3://snowflakebucket-copyoption/size/';

create or replace table orders(
ORDER_ID STRING,
AMOUNT STRING,
PROFIT INT,
QUANTITY INT,
CATEGORY VARCHAR(10),
SUBCATEGORY VARCHAR(30)
);

copy into orders
from @aws_stage
file_format=(format_name=ass_file);

copy into orders
from @aws_stage
file_format=(format_name=ass_file)
truncatecolumns=true;

select * from orders;