class ChatsController < ApplicationController
  before_action :check_chat_presence, only: :create

  def index
    chats = Chat.all
    recipient_ids = chats.each.pluck(:owner_id, :recipient_id)
    @recipients = User.find(recipient_ids)
  end

  def create
    @chat = Chat.create(chat_params)
    redirect_to @chat
  end

  def show
    @chat = Chat.find(params[:id])
  end

  def destroy
  end

  private

  def chat_params
    params.permit(:owner_id, :recipient_id)
  end

  def check_chat_presence
    chat = Chat.find_by(owner_id: current_user.id, recipient_id: params[:recipient_id])
    if chat.present?
      redirect_to chat_path(chat)
    else
      return
    end
  end
end