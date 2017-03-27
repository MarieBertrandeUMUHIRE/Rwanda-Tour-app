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
      flash[:warning] = 'Incomplete Information'
      redirect_to '/signup'
    end
  end
  def edit
     @user = User.find_by(id: current_user.id)
  end

  def update
    @user = User.find_by(id: current_user.id)
    @user.assign_attributes(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation]
    )
   if @user.save
    session[:user_id] = @user.id
    flash[:success] = 'Successfully updated your account!'
    redirect_to '/destinations'
  else
    flash[:warning] = 'Invalid email or password!'
    redirect_to '/login'
  end
end
end


