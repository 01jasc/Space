class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.text :comment
      t.references :user, null: false, foreign_key: true
      t.references :facility, null: false, foreign_key: true

      t.timestamps
    end
  end
end
