# frozen_string_literal: true

class Outbox < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :restrict_with_exception

  def outbox_messages
    messages
  end

  def outbox_newest_message
    messages.maximum(:created_at)
  end
end
