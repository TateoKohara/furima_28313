class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.integer :price, null: false
      t.text :comment, null: false
      t.integer :category, null: false
      t.integer :status, null: false
      t.integer :charge, null: false
      t.integer :send_place, null: false
      t.integer :send_days, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
