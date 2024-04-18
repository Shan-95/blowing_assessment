class CreateChances < ActiveRecord::Migration[7.0]
  def change
    create_table :chances do |t|
      t.references :frame
      t.integer :chance_no
      t.integer :chance_score, default: 0
      t.boolean :is_completed, default: false
      t.timestamps
    end
  end
end
