SELECT 
    date_id, 
    s.store_id, 
    dept_id, 
    weekly_sales as store_weekly_sales,
    fuel_price,
    unemployement,
    cpi,
    markdown1,
    markdown2,
    markdown3,
    markdown4,
    markdown5,
    current_timestamp() as insert_time,
    current_timestamp() as update_time,
    current_timestamp() as vrsn_start_date,
    '9999-12-31 00:00:00' as vrsn_end_date
FROM 
    {{ref("stg_department")}} d 
JOIN 
    {{ref("stg_fact")}} f 
        ON d.store_id = f.store_id AND d.date = f.store_date
JOIN 
    {{ref("stg_stores")}} s 
        ON f.store_id = s.store_id
JOIN 
    {{ref("dim_date")}} sd
        ON sd.store_date = d.date
-- ORDER BY 
--     date_id, 
--     store_id, 
--     dept_id