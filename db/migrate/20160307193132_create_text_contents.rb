class CreateTextContents < ActiveRecord::Migration
  def change
    create_table :text_contents do |t|
      t.string :text
      t.string :label
      t.string :parent
      t.string :parent_class

      t.timestamps null: false
    end
  end
end
