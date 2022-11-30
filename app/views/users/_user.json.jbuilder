json.extract! user, :id, :gender, :title, :first_name, :last_name, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
