class Contact < ApplicationRecord
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  def as_json
    {
      id: id,
      first_name: first_name,
      middle_name: middle_name,
      last_name: last_name,
      email: email,
      japan_phone_number: japan_phone_number,
      updated_at: friendly_updated_at,
      full_name: full_name,
      bio: bio
    }
  end

  def friendly_updated_at
    updated_at.strftime("%A, %b %d")
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def japan_phone_number
    # regular phone number with a +86 at the beginning
    return "+86 #{phone_number}"
  end

  def self.all_johns
    # go through all the contacts
    johns = []
    contacts = Contact.all
    contacts.each do |contact|
      if contact.first_name.downcase == "john"
        johns << contact
      end
    end
    # return an array where all of the contacts are named john
    johns
  end
end
