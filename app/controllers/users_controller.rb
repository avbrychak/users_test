class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def index
    case params[:users]
    when 'admin'
      @users = User.admin_users
    when 'sample'
      @users = User.sample_users
    when 'inactive'
      @users = User.inactive_users
    when 'all'
      @users = User.all_users
    end
    respond_to do |format|
      format.json { render json: @users }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
