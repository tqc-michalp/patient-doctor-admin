# patient-doctor-admin

Contains the following models:
* User;
* Message;
* Inbox;
* Outbox;
* Payment.

When a user sends a message, it goes into their outbox and the inbox of the recipient.

## Launch app

```
$ cd patient-doctor-admin
$ bundle install
$ rails db:schema:load
$ rails db:seed
```
Create:
* A patient, admin and doctor user;
* An inbox and outbox for each of the created users;
* A message from a doctor to a patient, which thanks them for applying for treatment.

```
rails s
```

## Task 1

Patients should have the ability to send a message to their doctor through the app.

* A message should only be sent to a doctor if the original message was created in the past week;
* If the original message was created more than a week ago then the message should be routed to an Admin.

Result of submitting the form:
1. Create a new message, marked as unread;
1. Update the sender's outbox;
1. Update the recipient's inbox.

Notes:
1. There will only be one doctor in the DB;
1. Don't need to worry about sessions or security;
1. The design should assume that a doctor will have plenty of messages in their inbox.

#### Testing

1. A message has an unread status after creation;
1. A message is sent to the correct inbox and outbox after creation.
 
## Task 2

Doctors have requested the ability to quickly see how many unread messages they have in their inbox. Add a new column to Inbox that reflects this number. Update this number when a message has been sent to the doctor.

#### Testing

The number of unread messages is:
1. Decremented when a doctor reads a message;
1. Incremented when a doctor is sent a message.

## Task 3

Patients regularly lose their prescription notes. An admin can re-issue a prescription note on behalf of a doctor. Update the application as follows:

1. When the patient clicks the "I've lost my script, please issue a new one at a charge of €10" button, it should send a hardcoded message to an admin requesting a new script;
1. An API request to our Payment Provider should be called;
1. A new Payment record should be created.

#### Testing

1. A lost script message is sent to the admin, and the Payment API is called, and Payment Record is created;
2. The call to the Payment API fails for some reason - ensure that the application gracefully degrades.
