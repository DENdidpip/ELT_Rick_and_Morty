{% macro extract_id(column) %}
    split_part( {{ column }}::string, '/', 6)::int
{% endmacro %}