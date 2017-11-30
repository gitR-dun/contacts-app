

100.times do
  contact1 = Contact.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number)
  contact1.save
  p contact1
end


