json.extract! user, :id, :first_name, :last_name, :awatar, :email, :password_digest, :created_at, :updated_at
json.url user_url(user, format: :json)