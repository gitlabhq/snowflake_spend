{% docs snowflake_warehouse_metering %}

This is the base model for the Snowflake Warehouse Metering History table https://docs.snowflake.net/manuals/sql-reference/account-usage/warehouse_metering_history.html.

To grant appropriate roles for these tables the following command was run:

`GRANT IMPORTED PRIVILEGES ON DATABASE snowflake TO ROLE <role>;`

https://docs.snowflake.net/manuals/user-guide/data-share-consumers.html#granting-privileges-on-a-shared-database

{% enddocs %}