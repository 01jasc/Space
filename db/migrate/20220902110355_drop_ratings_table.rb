class DropRatingsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :ratings
  end
end
