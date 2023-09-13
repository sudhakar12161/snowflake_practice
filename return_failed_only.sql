create or replace table orders(
ORDER_ID STRING,
AMOUNT STRING,
PROFIT INT,
QUANTITY INT,
CATEGORY VARCHAR(30),
SUBCATEGORY VARCHAR(30)
);

CREATE OR REPLACE STAGE COPY_DB.PUBLIC.AWS_STAGE_error
URL='s3://snowflakebucket-copyoption/returnfailed/';

copy into orders
from @aws_stage
file_format=(format_name=ass_file)
return_failed_only=true;

select * from orders;

copy into orders
from @aws_stage
file_format=(format_name=ass_file)
on_error=continue
return_failed_only=true;