class CreateAchievements < ActiveRecord::Migration[5.2]
  def change
    create_table :achievements do |t|
        t.integer :user_id
        t.integer :activity_id
        t.integer :frequency
        t.timestamps
    end
  end
end
