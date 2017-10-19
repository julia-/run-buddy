class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.references :profile, foreign_key: true
      t.string :skill_level

      t.timestamps
    end
  end
end
