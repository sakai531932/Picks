class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end

  def follow
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    redirect_to root_path
  end 
  
  def follow_list
    @user = User.find(params[:user_id])
  end
  
  def follower_list
    @user = User.find(params[:user_id])
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end