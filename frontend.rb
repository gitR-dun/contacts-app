# require unirest
require 'unirest'
require 'pp'

while true
  system 'clear'
  # make an http request to my app
  p "welcome to the app. tell me what you would like to do"
  p "[1] show all the contacts"
  p "[2] show a particular contact"
  p "[3] create a new contact"
  p "[4] update an existing contact"
  p "[5] Signup"
  p "[6] Login"
  p "[7] Logout"
  p "[exit]"

  user_input = gets.chomp

  if user_input == '1'
    # make a unirest call to the index action
    response = Unirest.get("localhost:3000/contacts")
    # show them all the contacts
    pp response.body
  elsif user_input == '2'
    # show action
    # have user input the id of what they want to see
    p "type in the id of the contact you want to see"
    contact_id = gets.chomp
    response = Unirest.get("localhost:3000/contacts/#{contact_id}")
    # show that to them
    pp response.body
  elsif user_input == '3'
    # create
    # get a bunch of user input
    the_params = {}
    p "enter the first name"
    the_params['first_name'] = gets.chomp
    p "enter the last name"
    the_params['last_name'] = gets.chomp
    p "enter the middle name"
    the_params['middle_name'] = gets.chomp
    p "enter the email"
    the_params['email'] = gets.chomp
    p "enter the bio"
    the_params['bio'] = gets.chomp
    p "enter the phone number"
    the_params['phone_number'] = gets.chomp
    # save it to a hash
    # send that hash as params with Unirest
    response = Unirest.post("localhost:3000/contacts", parameters: the_params)
    pp response.body
  elsif user_input == '4'
    # get info from the user about which iterm they want to edit
    p "tell me the id of the contact you want to edit"
    contact_id = gets.chomp
    # get that info from the API
    response = Unirest.get("localhost:3000/contacts/#{contact_id}")
    the_contact = response.body
    # get info from them about what they want the new attributes for that item to be
    the_params = {}
    p "enter the first name the original first name was #{the_contact['first_name']}"
    the_params['first_name'] = gets.chomp
    p "enter the middle name the original middle name was #{the_contact['middle_name']}"
    the_params['middle_name'] = gets.chomp
    p "enter the last name the original last name was #{the_contact['last_name']}"
    the_params['last_name'] = gets.chomp
    p "enter the email the original email was #{the_contact['email']}"
    the_params['email'] = gets.chomp
    p "enter the bio the original bio was #{the_contact['bio']}"
    the_params['bio'] = gets.chomp
    p "enter the phone number the original phone number was #{the_contact['phone_number']}"
    the_params['phone_number'] = gets.chomp
    # save it to a hash
    # send that hash as params with Unirest
    response = Unirest.patch("localhost:3000/contacts/#{contact_id}", parameters: the_params)
    pp response.body
    #
    # make a unirest request to save those changes to the db
  elsif user_input == '5'
    # signup
    the_params = {}
    p "enter your name"
    the_params[:name] = gets.chomp
    p "enter your email"
    the_params[:email] = gets.chomp
    p "enter your password"
    the_params[:password] = gets.chomp
    p "enter your password_confirmation"
    the_params[:password_confirmation] = gets.chomp
    response = Unirest.post(
      "http://localhost:3000/users",
      parameters: the_params
    )
    user = response.body
    pp user
  elsif user_input == '6'
    p "type in your email"
    user_email = gets.chomp
    p 'type in your password'
    user_password = gets.chomp
    response = Unirest.post(
    "http://localhost:3000/user_token",
    parameters: {
        auth: {
          email: user_email,
          password: user_password
        }
      }
    )

    # Save the JSON web token from the response
    jwt = response.body["jwt"]
    # Include the jwt in the headers of any future web requests
    Unirest.default_header("Authorization", "Bearer #{jwt}")

    pp response.body
  elsif user_input == '7'
    jwt = ""
    Unirest.clear_default_headers()
    pp jwt
  elsif user_input == 'exit'
    break
  end
end
