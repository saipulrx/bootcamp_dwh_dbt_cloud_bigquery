with
    source as (
        select
            id,
            transaction_type,
            transaction_created_date,
            transaction_modified_date,
            product_id,
            quantity,
            purchase_order_id,
            customer_order_id,
            comments
        from {{ ref("inventory_transactions") }}
    )
select
    id,
    transaction_type,
    transaction_created_date,
    transaction_modified_date,
    product_id,
    quantity,
    purchase_order_id,
    customer_order_id,
    comments,
    current_timestamp() as ingestion_timestamp
from source
