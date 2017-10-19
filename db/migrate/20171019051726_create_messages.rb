class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :conversation, foreign_key: true
      t.text :content
      t.boolean :from_profile_a

      t.timestamps
    end
  end
end
