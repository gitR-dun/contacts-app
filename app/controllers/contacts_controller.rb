class ContactsController < ApplicationController
  def the_contact
    # grab a contact from the db
    the_contact = Contact.first

    # show that contact to the user
    render json: {
      first_name: the_contact.first_name,
      last_name: the_contact.last_name,
      email: the_contact.email,
      phone_number: the_contact.phone_number,
    }
  end
end
