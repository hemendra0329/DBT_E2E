select distinct 
    md5(store_date) as date_id,
    store_date,
    is_holiday,
    current_timestamp() as insert_date,
    current_timestamp() as update_date
from  
     {{ref("stg_fact")}} as fact
order by store_date