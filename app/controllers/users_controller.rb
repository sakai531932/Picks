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
    
    @room = Room.new
    @room.user_id = current_user.id
    @room.save
    
    @room = Room.new
    @room.user_id = params[:user_id]
    @room.save
    
    @entry = Entry.new
    @entry.room_id = @room.id
    @entry.user_id = current_user.id
    @entry.save
    
    @entry = Entry.new
    @entry.room_id = @room.id
    @entry.user_id = params[:user_id]
    @entry.save
    
    redirect_to room_path(@room.id)
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