with base_spine as (
{{ dbt_utils.date_spine(
    datepart="day",
    start_date="to_date('01/01/1990', 'mm/dd/yyyy')",
    end_date="dateadd(year, 1, current_date)"
   )
}} 
)

select date_day
     , date_trunc('WEEK',date_day) as date_week
     , date_trunc('MONTH',date_day) as date_month
     , date_trunc('QUARTER',date_day) as date_quarter
     , date_trunc('YEAR',date_day) as date_year
  from base_spine