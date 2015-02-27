class Longititude < ActiveRecord::Migration
  def change
  	add_column :properties, :latitude, :float
  	add_column :properties, :Longititude, :float
  end
end
