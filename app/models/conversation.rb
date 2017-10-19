class Conversation < ApplicationRecord
  belongs_to :profile_a, class_name: 'Profile'
  belongs_to :profile_b, class_name: 'Profile'
  has_many :messages
end
