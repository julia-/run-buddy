class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :postcode
      t.text :profile_photo_data
      t.text :bio
      t.string :contact_number

      t.timestamps
    end
  end
end
