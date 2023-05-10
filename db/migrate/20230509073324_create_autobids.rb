class CreateAutobids < ActiveRecord::Migration[7.0]
  def change
    create_table :autobids do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :alert

      t.timestamps
    end
  end
end
