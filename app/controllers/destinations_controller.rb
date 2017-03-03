class DestinationsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :update]
  def index
    @destinations = Destination.all
  end
  def show
    @destination = Destination.find_by(id: params[:id])
  end

  def new
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

  def edit
    @regions = Region.all
    @categories = Category.all
    @destination = Destination.find_by(id: params[:id])
  end

  def update
    @destination = Destination.update({
      name: params[:name],
      description: params[:description],
      user_id: current_user.id,
      region_id: params[:region_id],
      category_id: params[:category_id]
      })
    
      redirect_to "/images/edit?destination_id=#{@destination.last['id']}"
  end
end


