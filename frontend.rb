# require unirest
require 'unirest'
# make an http request to my app
response = Unirest.get("http://localhost:3000/first_contact")

# show the user that data
contact = response.body

p "this person's name is #{contact['first_name']} #{contact['last_name']}"

p  "this person's phone number is #{contact['phone_number']}"
p  "this person's email is #{contact['email']}"
