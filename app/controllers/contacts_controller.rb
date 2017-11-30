class ContactsController < ApplicationController
  def the_contact
    # grab a contact from the db
    the_contact = Contact.first

    # show that contact to the user
    render json: the_contact.as_json
  end

  def all_contacts
    # array of contacts
    contacts = Contact.all
    contact_hashes = []
    #  I want an array of hashes
    i = 0
    contacts.length.times do
      # take each contact and convert it to a hash

      the_contact = {first_name: contacts[i].first_name,
         last_name: contacts[i].last_name,
         email: contacts[i].email,
         phone_number: contacts[i].phone_number }
      contact_hashes << the_contact
      i += 1
    end
    render json: contact_hashes

  end
end
