class AddImgToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :img, :string
  end
end
