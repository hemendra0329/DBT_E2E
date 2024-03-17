select 
    * 
from {{ source('sf', 'b_fact')}}