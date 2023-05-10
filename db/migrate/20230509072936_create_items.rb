class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.integer :bid
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
