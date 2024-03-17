select  
    * 
from {{ source('sf', 'b_stores') }}