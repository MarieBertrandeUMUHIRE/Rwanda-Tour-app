class DestinationsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :update]
  def index
    if params[:filter] 
      input = params[:filter].capitalize
      @destinations = Category.find_by(title: input).destinations.all
      
    elsif params[:select]
      place = params[:select]
      @destinations = Region.find_by(name: place).destinations.all

    elsif params[:hotel]
      response = params[:hotel]
      @places =Region.find_by(name: response).destinations.all
      @destinations = []
      @places.each do |place|
         
        if place.category.title=="Hotels"
          @destinations << place
        end
      end

    else
     @destinations = Destination.all
    end
  end
  def show
    @destination = Destination.find_by(id: params[:id])
     @regions = Region.all
    @categories = Category.all
  end

  def new
    @destination = Destination.new
    @regions = Region.all
    @categories = Category.all
  end

  def create

    @destination = Destination.new({
      name: params[:name],
      description: params[:description],
      user_id: current_user.id,
      region_id: params[:region_id],
      category_id: params[:category_id]
      })

    if @destination.save
       redirect_to "/images/new?destination_id=#{@destination.id}"
    else
      flash[:warning] = "destination NOT Created"
      render :new
    end
  end

  # def user_params
  #   params.require(:user).permit(:avatar)
  # end

  def edit
    @regions = Region.all
    @categories = Category.all
    @destination = Destination.find_by(id: params[:id])
    @region = Region.find_by(id: @destination.region_id)
    @category = Category.find_by(id: @destination.category_id)
  end

  def update
    destination = Destination.find_by(id: params[:id])
    destination.assign_attributes({
      name: params[:name],
      description: params[:description],
      user_id: current_user.id,
      region_id: params[:region_id],
      category_id: params[:category_id]
      })
    if destination.save
      redirect_to "/destinations/#{destination.id}"
    else
      redirect_to :back
    end
  end
  def search
    search_query = params[:search_input]
    @destinations = Destination.where("name ILIKE ? OR description ILIKE ?", "%#{search_query}%", "%#{search_query}%")
    if @destinations.empty?
      flash[:info] = "No Results"
    end
    render :index
  end
    def destroy
    @destination = Destination.find_by(id: params[:id])
    @destination.destroy
    flash[:danger] = "Destination Deleted"
    redirect_to "/destinations"
  end
  def weather
    @weathers = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22kigali%2C%20rwanda%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys").body
  end
end



