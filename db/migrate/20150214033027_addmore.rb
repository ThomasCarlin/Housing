class Addmore < ActiveRecord::Migration
  def change
  	add_column :properties, :street, :string
  	add_column :properties, :xcoordinate, :decimal
  	add_column :properties, :ycoordinate, :decimal
  end
end
