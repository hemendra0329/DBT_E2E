select distinct
    store_id,
    dept_id,
    "Type" as store_type,
    "Size" as store_size,
    current_timestamp() as insert_date,
    current_timestamp() as update_date
FROM 
    {{ref("stg_department")}} d 
JOIN 
    {{ref("stg_stores")}} s 
        ON d.store_id = s."Store" 
ORDER BY 
    store_id,
    dept_id