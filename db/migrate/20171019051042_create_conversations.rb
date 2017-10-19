class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.references :profile_a, foreign_key: { to_table: :profiles }
      t.references :profile_b, foreign_key: { to_table: :profiles }

      t.timestamps
    end
  end
end
