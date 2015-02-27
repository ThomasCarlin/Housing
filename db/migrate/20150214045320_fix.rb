class Fix < ActiveRecord::Migration
  def change
  	remove_column :properties, :longitutude
  	add_column :properties, :longitude, :float
  end
end
