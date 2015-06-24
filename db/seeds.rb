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

question_list = [
  ["You find it easy to introduce yourself to other people", 0.5, 0.2],
  ["You often get so lost in thoughts that you ignore or forget your surroundings.", 0.4, 0.1],
  ["You fin it easy to stay relaxed and focused even when there is some pressure.", 0.3, 0.2],
  ["You don't usually initiativeconversations.", 0.6, 0.2],
  ["You don't usually initiate conversations", 0.2, 0.5],
  ["You feel a constant need for something new", 0.1, 0.6],
]

question_list.each do |text, x, y|
  Question.create(text: text, x_impact: x, y_impact: y)
end

