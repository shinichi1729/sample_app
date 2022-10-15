class UsersController < ApplicationController
  before_action :logged_in_user, only: ["edit", "update"]
  before_action :correct_user, only: ["edit", "update"]
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    # debugger
  end

  def create
    @user = User.new(user_params)    # 実装は終わっていないことに注意!
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(params[:id])
    if @user.update_attributes(user_params)
      # 成功したときの処理
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render "edit"
    end
  end
  private 
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in"
        redirect_to login_url
      end
    end
    def correct_user
      @user = User.find(params[:id])
      redirect_to root_url unless current_user?(@user)
    end
end
