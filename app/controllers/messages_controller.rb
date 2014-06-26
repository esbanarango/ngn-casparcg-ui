class MessagesController < ApplicationController

  respond_to :html, :json, :js

	def create
    @message_sender = MessageSender.new(params[:message_sender])
    @message_sender.send_message if @message_sender.valid?
    respond_with(:admin,@app_configuration)
	end

end
