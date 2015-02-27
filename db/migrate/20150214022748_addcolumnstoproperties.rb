class Addcolumnstoproperties < ActiveRecord::Migration
  def change
  	add_column :properties, :name, :string
  	add_column :properties, :description, :string
  	add_column :properties, :price, :string
  	add_column :properties, :bedrooms, :decimal
  	add_column :properties, :bathrooms, :decimal
  	add_column :properties, :type, :string
  	add_column :properties, :landlord, :string
  	add_column :properties, :parking, :integer
  	add_column :properties, :pet, :string 
  end
end
