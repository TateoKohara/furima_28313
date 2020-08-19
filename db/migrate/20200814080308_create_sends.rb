class CreateSends < ActiveRecord::Migration[6.0]
  def change
    create_table :sends do |t|
      t.integer :send_days, null: false
      t.timestamps
    end
  end
end
