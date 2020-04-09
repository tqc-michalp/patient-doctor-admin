# frozen_string_literal: true

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test 'created unread' do
    assert_not Message.first.read
  end

  test 'correct sender' do
    result = messages(:patient_to_doctor).outbox.user.is_patient?
    assert result
  end

  test 'correct reciver' do
    result = messages(:patient_to_doctor).inbox.user.is_doctor?
    assert result
  end
end
