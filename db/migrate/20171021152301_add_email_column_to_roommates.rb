class AddEmailColumnToRoommates < ActiveRecord::Migration
  def change
  	add_column :roommates, :email, :string
  end
end