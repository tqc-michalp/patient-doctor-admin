# frozen_string_literal: true

class Payment < ApplicationRecord
  MODES = %w[debit_card].freeze

  belongs_to :user

  validates :mode, presence: true, inclusion: { in: MODES }

  def checkout(key)
    Provider.public_send(mode, key)
  end
end
