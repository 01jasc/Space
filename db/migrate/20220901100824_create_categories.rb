class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :title
      t.text :explanation
      t.string :icon
      t.string :capacity_type
      t.references :facility, null: false, foreign_key: true

      t.timestamps
    end
  end
end
