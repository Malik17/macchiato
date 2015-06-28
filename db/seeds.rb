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
  ["You find it easy to introduce yourself to other people", 1, 0, 1],
  ["You often get so lost in thoughts that you ignore or forget your surroundings.", 0, 1, 1],
  ["You find it easy to stay relaxed and focused even when there is some pressure.", 0, 1, 1],
  ["You don't usually initiate conversations", 1, 0, 1],
  ["You feel a constant need for something new", 1, 0, 1],
  ["You have numerous and varied interests rather than several specific ones", 1, 0, 1],
  ["Being adaptable is more important to you than being organised", 0, -1, 1],
  ["Solving practical problems interests you more than finding answers to existential questions", 0, 1, 1],
  # ["Winning a debate is more important to you than making sure no one gets upset", 0, 1],
  # ["You often feel as if you have to justify yourself to other people", -1, 0],
  # ["Your home and work environments are quite tidy", 0, 1],
  # ["You do not mind being at the center of attention", 1, 0],
  # ["You would rather call yourself pragmatic than visionary", 0, 1],
  # ["You rarely get mood swings", -1, 1],
  # ["Your travel plans are usually well thought out", -1, 0],
  # ["It is often difficult for you to relate to other people’s feelings", 0, 1],
  # ["Your mood can change very quickly", 1, 0],
  # ["In a discussion, truth should be more important than people’s sensitivities", 0, 1],
  # ["You rarely worry about how your actions affect other people", 0, 1],
  # ["Your work style is closer to random energy spikes than to methodical and organised approach", 0, -1],
  # ["You are often envious of others", -1, 0],
  # ["An interesting book or a video game is often better than a social event", -1, 0],
  # ["Being able to develop a plan and stick to it is the most important part of every project", 0, 1],
  # ["Other would call you ingenious as you are constantly generating original ideas", 1, 0],
  # ["If someone does not respond to your e-mail quickly you start worrying if you said something wrong", 0, -1],
  # ["As a parent you would rather see you child grow up kind than smart", 0, -1],
  # ["You do not mind tasks that involve a lot of routine", 1, 0],
  # ["Your dreams tend to be vivid and focus on a fictional world", 1, 0],
  # ["It does not take you too much time to start getting involved in social activities at your new workplace", 1, 0],
  # ["You are more of a natural improvise than a careful planner", 1, 0],
  # ["Generally, you would call yourself a very open-minded person", 0, -1],
  # ["You are not too interested in foreign food", 0, 1],
  # ["You often spend time exploring unrealistic and impractical yet intriguing ideas", 1, 0],
  # ["You would rather improvise than spend time coming up with a detailed plan", 1, 0],
  # ["You are relatively reserved and a quiet person", -1, 0],
  # ["If you had a business, you would find it very difficult to fire loyal but underperforming employees", 0, -1],
  # ["You have been called impractical quite a few times in the past", 1, 0],
  # ["Logic is usually more important than heart when it comes to making important decisions", 0, -1],
  # ["Keeping your options open is more important than having a to-do list", 1, 0],
  # ["If your friend is sad about something, you are more likely to offer emotional support that suggest ways to deal with the problem", 0, -1],
  # ["You rarely fee insecure", 1, 0],
  # ["You have no difficulties coming up with a personal timetable and sticking to it", -1, 0],
  # ["Being right is more important than being cooperative when it comes to teamwork", 0, 1],
  # ["You think that everyone’s views should be respected regardless of whether they are supported by facts or not", 0, -1],
  # ["You fee more energetic after spending time with a group of people", 1, 0],
  # ["Generally, you are a creature of habit", -1, 0],
  # ["You see yourself as very emotionally stable", 0, -1],
  # ["Your mind is always buzzing with unexplored ideas and plans", 1, 0],
  # ["You would call yourself a dreamer", 1, 0],
  # ["You usually find it difficult to relax when talking in front of many people", 1, 0],
  # ["You get easily bored with the usual way of doing things", 1, 0],
  # ["You worry too much about what other people think", 0, -1],
  # ["If the room is full, you stay closer to the walls, avoiding the center", -1, 0],
  # ["You prefer to think about practical and tangible concepts", -1, 0],
  # ["You feel very anxious in stressful situations", 1, 0],
  # ["You are rarely interested in trying something new just for the sake of it", -1, 0],
  # ["You focus on the possibilities rather than the realities", 1, 0],
  # ["You often take the initiative in social situations", 1, 0],
]

question_list.each do |text, x, y, z|
  Question.create(text: text, x_impact: x, y_impact: y, z_impact: z)
end

