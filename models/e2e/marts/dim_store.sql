{{
    config(
        materialized='table',

    )
}}
        -- unique_key = ['store_id'],
        -- merge_exclude_columns = ('insert_date')

select distinct
    store_id,
    store_type,
    store_size,
    current_timestamp() as insert_date,
    current_timestamp() as update_date
FROM 
    {{ref("stg_stores")}} s 
LEFT JOIN
    {{ref("stg_department")}} d 
    using (store_id)


-- {% if is_incremental() %}

--     where d.insert_date >= (select max(insert_date) from {{ this }}) 
        
-- {% endif %}

        
ORDER BY 
    store_id