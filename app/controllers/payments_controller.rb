# frozen_string_literal: true

class PaymentsController < ApplicationController
  def create
    message = Message.find(payment_params[:message_id])
    patient = User.current
    User.default_admin.inbox_messages.create(
      outbox_id: patient.outbox.id,
      body: "I've lost my prescription. Please generate and send me another one. I've paid"
    )
    payment = patient.payments.create(mode: payment_params[:mode])
    payment.checkout(payment_params[:key])
    message.touch
    flash[:notice] = 'Request to generate new prescription was sent to Admin. Thank You!'
    redirect_to messages_path
  end

  private

  def payment_params
    params.require(:payment).permit(:message_id, :mode, :key)
  end
end
