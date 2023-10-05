{% snapshot demo%}


{% set new_schema = target.schema + '_demo_snapshot' %}

{{
    config(
        target_database = 'analytics',
        target_schema = new_schema,
        unique_key='order_id',

        strategy='timestamp',
        updated_at='updated_at'
    )
}}

select * from analytics.{{target.schema}}.try

{% endsnapshot %}