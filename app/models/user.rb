# frozen_string_literal: true

class User < ApplicationRecord
  has_one :inbox, dependent: :restrict_with_exception
  has_one :outbox, dependent: :restrict_with_exception
  has_many :payments

  scope :patient, -> { where(is_patient: true) }
  scope :admin, -> { where(is_admin: true) }
  scope :doctor, -> { where(is_doctor: true) }

  delegate :inbox_messages, to: :inbox
  delegate :outbox_messages, to: :outbox

  def self.current
    patient.first
  end

  def self.default_admin
    admin.first
  end

  def self.default_doctor
    doctor.first
  end

  def to_s
    "#{first_name} #{last_name}"
  end
end
