class MessagesController < ApplicationController
  before_action :logged_in?
  before_action :correct_user,   only: :destroy
  
  def destroy
    @room = @message.room
    @message.destroy
    flash[:success] = "メッセージが削除されました"
    redirect_to @room
  end
  
  def create
    @message = Message.new(message_params)
    room = Room.find(message_params[:room_id])
    #binding.pry
    if @message.save
      redirect_to messages_path, method: :get
    else
      @messages = room.messages
      render "show"
    end
  end
  
  def index
  end
    
  private
    
    def message_params
      params[:message].merge!({ user_id: current_user.id })
      params.require(:message).permit(:user_id, :room_id, :content)
    end
  
    def correct_user
      @message = current_user.messages.find_by(id: params[:id])
      redirect_to root_path if @message.nil?
    end
end
