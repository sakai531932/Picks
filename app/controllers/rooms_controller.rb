class RoomsController < ApplicationController
  #before_action :logged_in_user
  before_action :correct_member, only: [:show, :messages]
  
  def show
    @room = current_user.rooms.find_by(id: params[:id])
    @messages = @room.messages
    @message = Message.new
  end
  
  def messages
    @message = Message.new(message_params)
    @room.touch
    if @message.save
      redirect_to @room
    else
      @messages = @room.messages
      render "show"
    end
  end
  
  
  private
    
    def message_params
      params[:message].merge!({ user_id: current_user.id, room_id: @room.id })
      params.require(:message).permit(:user_id, :room_id, :content)
    end
    
    def correct_member
      @room = current_user.rooms.find_by(id: params[:id])
      redirect_to root_path if @room.nil?
    end
    
    def correct_user
      @message = current_user.messages.find_by(id: params[:id])
      redirect_to root_path if @message.nil?
    end
    
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to root_path
      end
    end
  
end
