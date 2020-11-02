class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]

  def show
    @user = User.find(params[:id])
    @opinions = @user.opinions.ordered_by_most_recent
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      flash[:notice] = "Welcome, #{@user.username} to Twitter"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :fullname, :photo, :coverimage)
  end
end
