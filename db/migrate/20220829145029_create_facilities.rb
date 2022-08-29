class CreateFacilities < ActiveRecord::Migration[7.0]
  def change
    create_table :facilities do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :address
      t.integer :capacity
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
