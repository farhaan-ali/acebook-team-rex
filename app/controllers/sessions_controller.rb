class SessionsController < ApplicationController

  skip_before_action :authorised, only: [:new, :create, :welcome]

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id]= @user.id
      
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def login

  end

  def welcome
    p current_user
  end
end
