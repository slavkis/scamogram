class ChatsController < ApplicationController
  def index
    @chats = Chat.where("recipient_id = ? OR user_id = ?", current_user.id, current_user.id)
  end

  def create
    @chat = current_user.chats.find_or_create_by(chat_params)
    redirect_to @chat
  end

  def show
    @chat = Chat.find(params[:id])
  end

  def destroy
  end

  private

  def chat_params
    params.permit(:recipient_id)
  end
end