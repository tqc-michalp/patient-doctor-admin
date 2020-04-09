# frozen_string_literal: true

class MessagesController < ApplicationController
  def show
    @message = Message.find(params[:id])
    @message.update_attribute(:read, true)

    fresh_when last_modified: @message.updated_at.utc, etag: @message
  end

  def new
    @message = Message.new(
      inbox_id: params[:outbox_id],
      outbox_id: params[:inbox_id]
    )
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Message: #{@message.body.truncate(70, separator: ' ')} sent to #{@message.inbox.user}"
      redirect_to messages_path
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:outbox_id, :inbox_id, :body)
  end
end
