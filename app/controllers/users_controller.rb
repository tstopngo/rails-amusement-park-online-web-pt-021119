class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      raise @user.errors.full_message
    end
  end

  def show
    if logged_in?
      @user= current_user
    else
      redirect_to '/'
    end
  end



  private

  def user_params
   params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
 end


end
