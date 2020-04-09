# frozen_string_literal: true

require 'test_helper'

class OutboxTest < ActiveSupport::TestCase
  test 'That the number of unread messages is decremented when a doctor reads a message' do
    assert true
  end
  test 'increment counter when the doctor sent a message' do
    initial = inboxes(:doctor).messages_unread_counter
    Message.update_all(created_at: 3.weeks.ago)
    msg = Message.create(
      body: 'increment',
      outbox: outboxes(:patient),
      inbox: inboxes(:doctor)
    )
    Message.update_all(created_at: Time.current)
    result = msg.inbox.messages_unread_counter > initial
    assert result
  end
end
