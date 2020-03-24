class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :name, null: false
      t.integer :rent, null: false
      t.string :address, null: false
      t.integer :year, null: false
      t.text :remarks, null: false

      t.timestamps
    end
  end
end
