class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
    @profile = Profile.where(user_id: current_user.id)
  end
  def new
    @profile = Profile.new
  end
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to profiles_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:image, :introduction, :age, :price, :nickname)
  end
end
