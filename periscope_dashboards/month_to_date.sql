SELECT sum(dollars_spent) AS dollars_spend
FROM  analytics.snowflake_warehouse_metering_xf
WHERE  usage_month = date_trunc('month', CURRENT_TIMESTAMP)::date
