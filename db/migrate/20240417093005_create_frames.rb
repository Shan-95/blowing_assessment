class CreateFrames < ActiveRecord::Migration[7.0]
  def change
    create_table :frames do |t|
      t.references :game
      t.integer :frame_no
      t.integer :frame_score, default: 0
      t.string :frame_type
      t.boolean :is_completed, default: false
      t.timestamps
    end
  end
end
