class CreateHolding < ActiveRecord::Migration[6.0]
  def change
    create_table :holdings do |t|
      t.string :ticker
      t.string :name
      t.integer :units
      t.float :price
      t.datetime :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
