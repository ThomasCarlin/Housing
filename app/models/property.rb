class Property < ActiveRecord::Base
	geocoded_by :street
	after_validation :geocode
end
