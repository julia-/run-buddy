class Profile < ApplicationRecord
  belongs_to :user
  has_many :activities
  has_many :conversations
  
  accepts_nested_attributes_for :activities

  include ProfileImageUploader[:profile_photo]
end
