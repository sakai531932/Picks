class MessagesController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user,   only: :destroy
  
  def destroy
    @room = @message.room
    @message.destroy
    flash[:success] = "メッセージが削除されました"
    redirect_to @room
  end
  
  private
    
    def correct_user
      @message = current_user.messages.find_by(id: params[:id])
      redirect_to root_path if @message.nil?
    end
end
