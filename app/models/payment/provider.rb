# frozen_string_literal: true

class Payment::Provider
  def self.debit_card(key)
    Rails.logger.info("Sent POST https://provider.com/payments/#{key}")
  end
end
