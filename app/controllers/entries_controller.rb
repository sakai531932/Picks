class EntriesController < ApplicationController
  #before_action :logged_in?
  before_action :correct_user, only: :destroy
  
  def create
    @room = Room.find(params[:room_id])
    params[:user_id].each do |guest_user|
      if @room.member?(user_id)
        
      else
        @room.add_member(user_id)
      end
    end
  end

  def destroy
    @entries.destroy
    flash[:success] = "トークルームから退出しました"
    redirect_to root_path
  end
  
  private
    
    def correct_user
      @entries = current_user.entries.find_by(id: params[:id])
      redirect_to root_path if @entries.nil?
    end
end
