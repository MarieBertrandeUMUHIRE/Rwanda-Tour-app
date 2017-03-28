class PagesController < ApplicationController
  def index
    @images = Image.all
  end
  def search
    @destinations = Destination.all
    search_query = params[:search_input]
    @destinations = Destination.where("name LIKE ? OR description LIKE ?", "%#{search_query}%", "%#{search_query}%")
    if @destinations.empty?
      flash[:info] = "No Results"
    end
    render :index
  end
end
