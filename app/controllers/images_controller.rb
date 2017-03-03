class ImagesController < ApplicationController
  def new
    @destination = Destination.find_by(id: params[:destination_id])
  end
  def create
    image = Image.new(url: params[:url], destination_id: params[:destination_id])
    if image.save
      redirect_to "/destinations/#{image.destination_id}"
    end
  end
   
  def edit
     @destination = Destination.find_by(id: params[:destination_id])
  end

  def update
    image = Image.update(url: params[:url], destination_id: params[:destination_id])
    if image.save
      redirect_to "/destinations/#{image.destination_id}"
    end
  end

end
