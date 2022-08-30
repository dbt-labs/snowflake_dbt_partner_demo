select * 
from {{ metrics.calculate(
    metric('revenue'),
    grain='month',
    dimensions=['priority_code']
) }}

