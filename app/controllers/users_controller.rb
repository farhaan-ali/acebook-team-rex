class UsersController < ApplicationController

  skip_before_action :authorised, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      render 'users/new'
    end
  end

  def show
    @user = User.find(params[:id])
    @friends = Friend.where("requester_id = ? or requestee_id = ?", [@user.id],[@user.id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def somefunction(user)
    friends = Friend.where("requester_id = ? or requestee_id = ?", [user.id],[user.id])
  end

end
