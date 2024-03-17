SELECT 
    date_id, 
    store_id, 
    dept_id, 
    weekly_sales as store_weekly_sales,
    "Fuel_Price" as fuel_price,
    "Unemployment" as unemployment,
    "CPI" as cpi,
    "MarkDown1" as markdown1,
    "MarkDown2" as markdown2,
    "MarkDown3" as markdown3,
    "MarkDown4" as markdown4,
    "MarkDown5" as markdown5,
    current_timestamp() as insert_time,
    current_timestamp() as update_time,
    current_timestamp() as vrsn_start_date,
    current_timestamp() as vrsn_end_date
FROM 
    {{ref("stg_department")}} d 
JOIN 
    {{ref("stg_fact")}} f 
        ON d.store_id = f."Store" AND d.date = f."Date"
JOIN 
    {{ref("stg_stores")}} s 
        ON f."Store" = s."Store"
JOIN 
    {{ref("dim_date")}} sd
        ON sd.store_date = d.date
-- ORDER BY 
--     date_id, 
--     store_id, 
--     dept_id