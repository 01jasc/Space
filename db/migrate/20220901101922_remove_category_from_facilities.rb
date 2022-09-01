class RemoveCategoryFromFacilities < ActiveRecord::Migration[7.0]
  def change
    remove_column :facilities, :category, :string
  end
end
