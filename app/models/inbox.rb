# frozen_string_literal: true

class Inbox < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :restrict_with_exception

  def inbox_messages
    messages
  end
end
