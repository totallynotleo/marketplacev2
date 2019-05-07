json.extract! listing, :id, :title, :user_id, :cost, :description, :created_at, :updated_at
json.url listing_url(listing, format: :json)
