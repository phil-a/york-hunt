# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.create!(name:  "Example User",
#              email: "example@railstutorial.org",
#              password:              "foobar",
#              password_confirmation: "foobar",
#              admin: true,
#              activated: true,
#              activated_at: Time.zone.now)

User.create!(name:  "Philip",
             email: "phil.alekseev@gmail.com",
             password:              "test123",
             password_confirmation: "test123",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
             
User.create!(name:  "House Stark",
             email: "yorku.house.stark@gmail.com",
             password:              "test123",
             password_confirmation: "test123",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "House Lannister",
             email: "yorku.house.lannister@gmail.com",
             password:              "test123",
             password_confirmation: "test123",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "House Targaryen",
             email: "yorku.house.targaryen@gmail.com",
             password:              "test123",
             password_confirmation: "test123",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "House Baratheon",
             email: "yorku.house.baratheon@gmail.com",
             password:              "test123",
             password_confirmation: "test123",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)

# 99.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#               email: email,
#               password:              password,
#               password_confirmation: password,
#               activated: true,
#               activated_at: Time.zone.now)
# end

#Microposts
users = User.order(:created_at).take(6)
50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
end

# Following relationships (all following all)
for i in 1..(User.count-1)
    users = User.all
    user  = users.where(id: i).first
    following = users[i..(User.count-1)]
    followers = users[i..(User.count-1)]
    following.each { |followed| user.follow(followed) }
    followers.each { |follower| follower.follow(user) }
end

#Question Groups
question_groups = []
question_groups << Rapidfire::QuestionGroup.create(name: "General")

#Questions 

questions = []
questions << Rapidfire::Question.create(question_group_id: 1, type: "Rapidfire::Questions::Select", question_text: "What year was York University Founded?", position: nil, answer_options: "1959\r\n1960\r\n1961\r\n1962", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
questions << Rapidfire::Question.create(question_group_id: 1, type: "Rapidfire::Questions::Short", question_text: "What is the current Presidents full name?", position: nil, answer_options: "Mamdouh Shoukri", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
questions << Rapidfire::Question.create(question_group_id: 1, type: "Rapidfire::Questions::Radio", question_text: "What is the York University Mascot?", position: nil, answer_options: "Lion\r\nBear\r\nTiger\r\nDeer\r\nWolf", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
questions << Rapidfire::Question.create(question_group_id: 1, type: "Rapidfire::Questions::Short", question_text: "Founders college is named after these famous artis...", position: nil, answer_options: "Group of Seven", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})

#Solutions
solutions = []
solutions << Solution.create!(question_id: 1,
                 correct_answer_text: "1959")
solutions << Solution.create!(question_id: 2,
                 correct_answer_text: "Mamdouh Shoukri")
solutions << Solution.create!(question_id: 3,
                 correct_answer_text: "Lion")
solutions << Solution.create!(question_id: 4,
                 correct_answer_text: "Group of Seven")
