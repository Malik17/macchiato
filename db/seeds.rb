# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


corporation_list = [
  ["Apple","HR","Steve","Jobs","steve@me.com"],
  ["Microsoft","Accounting","Bill","Gates","william@microsoft.com"],
  ["Macchiato","WorldRevolution","Malik","Dauber","m.dauber@me.com"],
]

corporation_list.each do |name, division, contact_first, contact_last, email|
  token = SecureRandom.urlsafe_base64(16, true)
  Corporation.create(name: name, division: division, contact_first: contact_first, contact_last: contact_last, email: email, token: token)
end
