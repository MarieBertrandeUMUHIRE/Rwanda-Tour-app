class UsersController < ApplicationController
  def new
    render 'new.html.erb'
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
      )
    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Successfully created account!'
      redirect_to '/destinations'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/signup'
    end
  end

  def update
    user = User.find_by(id: params[:id])
     user.assign_attributes(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
      )
    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Successfully updated your account!'
      redirect_to '/destinations'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/login'
    end
  end
end

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