class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :user
      t.integer :total_score,default: 0
      t.boolean :is_completed, default: false
      t.timestamps
    end
  end
end
