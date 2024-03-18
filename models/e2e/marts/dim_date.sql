select distinct 
    md5("Date") as date_id,
    "Date" as store_date,
    "IsHoliday" as is_holiday,
    current_timestamp() as insert_date,
    current_timestamp() as update_date
from  
     {{ref("stg_fact")}} as fact