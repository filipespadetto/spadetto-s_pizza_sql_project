SELECT
    o.order_id,
    i.item_price,
    o.quantity,
    i.item_cat,
    i.item_name,
    o.created_at,
    a.delivery_addess1,
    a.delivery_addess2,
    a.delivery_city,
    a.delivery_zipcode,
    o.delivery
FROM
    orders o
LEFT JOIN item i ON o.item_id = i.item_id
LEFT JOIN address a ON o.add_id = i.item_id