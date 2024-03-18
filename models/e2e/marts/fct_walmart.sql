SELECT 
    date_id, 
    store_id, 
    dept_id, 
    weekly_sales as store_weekly_sales,
    "Fuel_Price" as fuel_price,
    case when "Unemployment" = 'NA' THEN NULL ELSE cast("Unemployment" as float) end as unemployment,
    case when "CPI" = 'NA' THEN NULL ELSE cast("CPI" as float) end as cpi,
    case when "MarkDown1" = 'NA' THEN NULL ELSE cast("MarkDown1" as float) end as markdown1,
    case when "MarkDown2" = 'NA' THEN NULL ELSE cast("MarkDown2" as float) end as markdown2,
    case when "MarkDown3" = 'NA' THEN NULL ELSE cast("MarkDown3" as float) end as markdown3,
    case when "MarkDown4" = 'NA' THEN NULL ELSE cast("MarkDown4" as float) end as markdown4,
    case when "MarkDown5" = 'NA' THEN NULL ELSE cast("MarkDown5" as float) end as markdown5,
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