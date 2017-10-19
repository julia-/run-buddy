json.extract! message, :id, :conversation_id, :content, :from_profile_a, :created_at, :updated_at
json.url message_url(message, format: :json)
