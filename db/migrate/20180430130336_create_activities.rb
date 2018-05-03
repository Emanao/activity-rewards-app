class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
        t.string :name
        t.integer :points, :default => 5

        t.timestamps
    end
  end
end
