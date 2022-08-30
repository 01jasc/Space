class AddPictureToFacilities < ActiveRecord::Migration[7.0]
  def change
    add_column :facilities, :picture, :string
  end
end
