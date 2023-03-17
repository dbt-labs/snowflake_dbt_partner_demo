{% macro kwargs_example(val, sub=5) %}
    {% set keyword_arguments = kwargs %}
    {{ keyword_arguments }}
    {{ log("Running kwargs_example: " ~ keyword_arguments, info=true) }}

{% if val is number %}
    {% set result= val|as_number - sub|as_number %}
    {{ log("Running kwargs_example: " ~ result, info=true) }}
{% else %}
    {{ exceptions.raise_compiler_error("Invalid `number`. Got: " ~ val) }}
{% endif %}

{% endmacro %}

-- The trick is that kwargs has to be accessed at least once in any macro that should accept them. 
-- That is to say, you must call {{ kwargs }} once in macro body without declaring it in macro argument list. 
-- The same is true for {{ varargs }}.

-- dbt run-operation kwargs_example --args '{val: 1, test: Hello}'
-- {{kwargs_example(1, 2, test="Hello")}} 

