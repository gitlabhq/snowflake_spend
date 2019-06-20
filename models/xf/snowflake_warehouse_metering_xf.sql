{{ config({
    "schema": "analytics",
    "post-hook": "grant select on {{this}} to role reporter"
    })
}}


WITH base AS (

	SELECT *
	FROM {{ ref('snowflake_warehouse_metering') }}


), usage AS (

        SELECT warehouse_id,
               warehouse_name,

               start_time,
               end_time,
               date_trunc('month', end_time)::date   AS usage_month,
               datediff(hour, start_time, end_time)  AS usage_length,
               credits_used,
               round(credits_used * 2.55, 2)         AS dollars_spent
        FROM base

)

SELECT *
FROM usage
