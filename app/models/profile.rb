class Profile < ApplicationRecord
  include ProfileImageUploader[:profile_photo]

  belongs_to :user
  has_many :activities
  has_many :conversations

  accepts_nested_attributes_for :activities

  # validates :first_name, :last_name, :profile_photo, :bio, presence: true
  # validates :postcode, length: { maximum: 4 }, numericality: { only_integer: true, greater_than: 0799, less_than: 7800 }
  # validates :contact_number, length: { maximum: 10 }, numericality: { only_integer: true }
end
