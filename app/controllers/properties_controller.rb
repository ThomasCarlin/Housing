class PropertiesController < ApplicationController
	require 'open-uri'
	require 'nokogiri'
	require 'mechanize'
  def index
    @properties = Property.all
    @property=Property.last
    @hash = Gmaps4rails.build_markers(@properties) do |property, marker|
    	if(property.latitude!=nil)
			  marker.lat property.latitude
			  marker.lng property.longitude
			  marker.infowindow property.street
			end
		end
		@agent = Mechanize.new
		@mechdoc= @agent.get('http://offcampus.osu.edu/search-housing.aspx')
		@docstring=""
		i =1
		while i <1
			@doc = Nokogiri::HTML(open("http://offcampus.osu.edu/search-housing.aspx?page="+i.to_s))

			@doc.css("div.preview div.header h3 a").each do |node|
					@docproperty=Property.new
					@docproperty.street=node.text+" columbus Ohio USA 43201"
					@docstring+=node.text
			end
			i+=1
		end
  end
 
  def show
    @property = Property.find(params[:id])
  end
 
  def new
    @property = Property.new
  end
 
  def edit
    @property = Property.find(params[:id])
  end
 
  def create
    @property = Property.new(property_params)
 
    if @property.save
      redirect_to @property
    else
      render 'new'
    end
  end
 
  def update
    @property = Property.find(params[:id])
 
    if @property.update(property_params)
      redirect_to @property
    else
      render 'edit'
    end
  end
 
  def destroy
    @property = Property.find(params[:id])
    @property.destroy
 
    redirect_to properties_path
  end
 
  private
    def property_params
      params.require(:property).permit(:name, :description,:street,:latitude,:longitude)
    end
end
