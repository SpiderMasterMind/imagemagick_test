
class UsersController < ApplicationController
  def new
    @user = User.new
  
  end

  def create
    @user = User.new(name: user_params[:user])
    @user.avatar = user_params[:avatar]

    if @user.save
      redirect_to(@user, :notice => 'User was successfully created.')
    end
  end

  def show
    @user = User.find(params[:id])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :avatar)
  end
end