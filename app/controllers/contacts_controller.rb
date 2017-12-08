class ContactsController < ApplicationController
  def the_contact
    # grab a contact from the db
    the_contact = Contact.first

    # show that contact to the user
    render json: the_contact.as_json
  end

  def index
    # array of contacts
    contacts = Contact.all
    render json: contacts.as_json

  end

  def johns
    johns = Contact.all_johns
    render json: johns.as_json
  end
end
