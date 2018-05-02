class CreateAchievements < ActiveRecord::Migration[5.2]
  def change
    create_table :achievements do |t|
        t.integer :user_id
        t.integer :activity_id
        t.integer :frequency, :default => 0
        t.timestamps
    end
  end
end
