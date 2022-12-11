class MessagesController < ApplicationController
  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.create(message_params.merge({user_id: current_user.id}))
    if @message.save
      redirect_to @chat
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to request.referrer
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end