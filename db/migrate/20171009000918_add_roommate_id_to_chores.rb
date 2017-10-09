class AddRoommateIdToChores < ActiveRecord::Migration
  def change
    add_column :chores, :roommate_id, :integer
  end
end
