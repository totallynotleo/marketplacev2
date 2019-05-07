json.extract! order, :id, :user_id, :shipping_address, :created_at, :updated_at
json.url order_url(order, format: :json)
