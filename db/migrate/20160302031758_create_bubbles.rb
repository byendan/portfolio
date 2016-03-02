class CreateBubbles < ActiveRecord::Migration
  def change
    create_table :bubbles do |t|
      t.string :text
      t.integer :bub_num
      t.timestamps null: false
    end
  end
end
