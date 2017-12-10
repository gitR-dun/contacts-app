class ContactsController < ApplicationController
  def index
    # array of contacts
    contacts = Contact.all
    render json: contacts.as_json
  end

  def show
    the_id = params[:id]
    # grab a contact from the db
    the_contact = Contact.find_by(id: the_id)
    # show that contact to the user
    render json: the_contact.as_json
  end

  def create
    contact = Contact.new(
      first_name: params['first_name'],
      middle_name: params['middle_name'],
      last_name: params['last_name'],
      email: params['email'],
      phone_number: params['phone_number'],
      bio: params['bio']
    )
    contact.save
    render json: contact.as_json
  end

  def update
    the_id = params[:id]
    # combination of show and create
    # get the contact from the db
    contact = Contact.find_by(id: the_id)
    # edit that contact
    contact.update(
      first_name: params['first_name'],
      middle_name: params['middle_name'],
      last_name: params['last_name'],
      phone_number: params['phone_number'],
      email: params['email'],
      bio: params['bio']
    )
    render json: contact.as_json
  end

  def johns
    johns = Contact.all_johns
    render json: johns.as_json
  end
end
