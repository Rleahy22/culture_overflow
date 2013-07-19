# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do
  firstname = Faker::Name.first_name
  lastname = Faker::Name.last_name
  email = Faker::Internet.email
  User.create(username: "#{firstname+lastname}", password_hash: "password", email: email)
end

20.times do
  title = Faker::Lorem.words(10).join(" ").capitalize+"?"
  content = Faker::Lorem.paragraphs(8)
  User.all.sample.questions << Question.create(title: title, content: content)
end

40.times do
  content = Faker::Lorem.paragraphs(5)
  answer = Answer.create(content: content)
  User.all.sample.answers << answer
  Question.all.sample.answers << answer
end

25.times do
  content = Faker::Lorem.paragraphs(2)
  comment = Comment.create(content: content)
  User.all.sample.comments << comment
  Answer.all.sample.comments << comment  
end

# User.all.each do |user|
#   Answer.all.each do |answer|
#     AnswerVote.create(user_id: user.id, answer_id: answer.id, upordown: [+1, -1].sample) 
#   end
# end

User.all.each do |user|
  Question.all.each do |question|
    QuestionVote.create(user_id: user.id, question_id: question.id, upordown: [+1, -1].sample) 
  end
end

