class RemoveFacilityReferenceFromCategories < ActiveRecord::Migration[7.0]
  def change
    remove_reference :categories, :facility, null: false, foreign_key: true
  end
end
