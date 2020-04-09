# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :inbox
  belongs_to :outbox

  before_create :patient_limit_to_doctor
  before_create :update_inbox_messages_counter

  validates :body, presence: true

  delegate :outbox_newest_message, to: :outbox

  private

  def patient_limit_to_doctor
    return if outbox_newest_message.nil?
    return if inbox.user.is_patient?

    self.inbox_id = User.default_admin.inbox.id if outbox_newest_message > 1.week.ago
  end

  def update_inbox_messages_counter
    inbox.increment!(:messages_unread_counter) if inbox.user.is_doctor?
  end
end
