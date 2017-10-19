class Profile < ApplicationRecord
  belongs_to :user
  has_many :activities
  has_many :conversations
end
