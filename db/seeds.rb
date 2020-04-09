# frozen_string_literal: true

patient = User.create(first_name: 'JAMES', last_name: 'Smith', inbox: Inbox.new, outbox: Outbox.new)
doctor = User.create(first_name: 'DAVID', last_name: 'Johnson', is_doctor: true, is_patient: false, inbox: Inbox.new, outbox: Outbox.new)
admin = User.create(first_name: 'MARK', last_name: 'Williams', is_admin: true, is_patient: false, inbox: Inbox.new, outbox: Outbox.new)

Message.create(body: 'Thanks for your order. I will in touch shortly after reviewing your treatment application.',
               outbox: doctor.outbox,
               inbox: patient.inbox)
