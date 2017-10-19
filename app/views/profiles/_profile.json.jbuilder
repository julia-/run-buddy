json.extract! profile, :id, :user_id, :first_name, :last_name, :postcode, :profile_photo_data, :bio, :contact_number, :created_at, :updated_at
json.url profile_url(profile, format: :json)
