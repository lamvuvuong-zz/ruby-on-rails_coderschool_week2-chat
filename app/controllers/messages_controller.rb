class MessagesController < ApplicationController
  def new
  	@message = Message.new
  end

  def show
  	@message = Message.find_by id: params[:id]
    @message.send_time = Time.now
	   @message.save
  end

  def index
  	@messages = Message.where(sender_id: session[:user_id])
  end

  def create
  	@message = Message.create message_params
  	if @message.persisted?
  		flash[:success] = "Send complete"
  		redirect_to root_path
  	else
  		flash.now[:error] = "Error: #{@message.errors.full_messages.to_sentence}"
  		render 'new'
  	end
  end

  def destroy
  end
  private
  	def message_params
  		params.require(:message).permit(:title, :body, :send_time, :sender_id, :recipient_id)
  	end
end