class CreatePrefectures < ActiveRecord::Migration[6.0]
  def change
    create_table :prefectures do |t|
      t.integer :send_place, null: false
      t.timestamps
    end
  end
end
