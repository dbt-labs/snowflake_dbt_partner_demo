select * 
from {{ metrics.metric(
    metric_name='revenue',
    grain='month',
    dimensions=['priority_code']
) }}