SELECT
	warehouse_id,
	warehouse_name,
	start_time,
	end_time,
	credits_used
FROM {{ var('warehouse_metering_table') }} SNOWFLAKE.account_usage.warehouse_metering_history
