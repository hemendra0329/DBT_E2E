select distinct 
    store_id,
    dept_id
from {{ref("stg_department")}}

order by 
    store_id, 
    dept_id