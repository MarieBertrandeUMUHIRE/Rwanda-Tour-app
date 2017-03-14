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
end


