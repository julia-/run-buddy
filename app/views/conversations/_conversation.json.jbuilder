json.extract! conversation, :id, :profile_a_id, :profile_b_id, :created_at, :updated_at
json.url conversation_url(conversation, format: :json)
