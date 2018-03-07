class MessagesController < ApplicationController
  before_action :require_admin, only:[:destroy]
  def new
    @message=Message.new()
    @message.reciever=User.find_by(id:params[:id]) || User.find_by(email:'samirsuraj@live.com')
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    sender= current_user || @default_user
    @message = sender.sent_messages.build(message_params)
    if @message.save
      redirect_to root_url
      flash[:success]='message sent!'
    else
      flash[:danger]= 'message failed!'
      render :new
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    flash[:notice]='message deleted!'
    redirect_to current_user, remote:true
  end

  private
    def message_params
      params.require(:message).permit(:reciever_id, :topic, :body)
    end
end
