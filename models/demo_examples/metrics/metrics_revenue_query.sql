

select * 
from {{ metrics.calculate(
    metric('revenue'),
    grain='week',
    dimensions=['customer_key']
) }}

