{%- macro limit_data_in_dev(column_name, days_of_data=3) -%}
    {% if target.name == "dev" %}
        where {{ column_name }} >= dateadd(days, -3, current_timestamp)
    {% endif %}
{%- endmacro -%}
