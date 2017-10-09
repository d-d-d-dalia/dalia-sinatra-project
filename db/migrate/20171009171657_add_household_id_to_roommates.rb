class AddHouseholdIdToRoommates < ActiveRecord::Migration
  def change
    add_column :roommates, :household_id, :integer
  end
end
