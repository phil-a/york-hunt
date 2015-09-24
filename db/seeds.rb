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
User.create!(name:  "Admin",
email: "phil.alekseev@gmail.com",
password: "admin123",
password_confirmation: "admin123",
admin: true,
activated: true,
activated_at: Time.zone.now)
User.create!(name:  "House Stark",
email: "yorku.house.stark@gmail.com",
password: "test123",
password_confirmation: "test123",
admin: false,
activated: true,
activated_at: Time.zone.now)
User.create!(name:  "House Lannister",
email: "yorku.house.lannister@gmail.com",
password: "test123",
password_confirmation: "test123",
admin: false,
activated: true,
activated_at: Time.zone.now)
User.create!(name:  "House Targaryen",
email: "yorku.house.targaryen@gmail.com",
password: "test123",
password_confirmation: "test123",
admin: false,
activated: true,
activated_at: Time.zone.now)
User.create!(name:  "House Baratheon",
email: "yorku.house.baratheon@gmail.com",
password: "test123",
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
# users = User.order(:created_at).take(6)
# 50.times do
#     content = Faker::Lorem.sentence(5)
#     users.each { |user| user.microposts.create!(content: content) }
# end
User.find_by_name("Admin").microposts.create!(content: "Welcome to the Scavenger Hunt. \r\n All your answers will be posted here for all to see. \r\n Good Luck.".html_safe)
# Following relationships (all following all)
for i in 1..(User.count-1)
    users = User.all
    user  = users.where(id: i).first
    following = users[i..(User.count-1)]
    followers = users[i..(User.count-1)]
    following.each { |followed| user.follow(followed) }
    followers.each { |follower| follower.follow(user) }
end
# --------- TORONTO ----------
#Question Groups
question_groups = []
question_groups << Rapidfire::QuestionGroup.create(name: "Toronto")
#Questions & Solutions
questions = []
solutions = []
questions << Rapidfire::Question.create(question_group_id: 1, type: "Rapidfire::Questions::Select", question_text: "What are two nickanmes for Toronto?", position: nil, answer_options: "hogtown and the 6ix\r\nbirdtown and leaftown\r\nthe city above the lake and the city above the USA\r\nO-dot", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 1, correct_answer_text: "hogtown and the 6ix")
questions << Rapidfire::Question.create(question_group_id: 1, type: "Rapidfire::Questions::Short", question_text: "What is the longest street that goes through Toronto but does not necessarily start or end in Toronto?", position: nil, answer_options: "Bathurst\r\nQueen\r\nYonge\r\nFinch", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 2, correct_answer_text: "Yonge")
questions << Rapidfire::Question.create(question_group_id: 1, type: "Rapidfire::Questions::Radio", question_text: "Who of the following were born in Toronto", position: nil, answer_options: "Jimmy Kimmel\r\nDrake\r\nOChair Amal\r\nJohnny Depp", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 3, correct_answer_text: "Drake")
questions << Rapidfire::Question.create(question_group_id: 1, type: "Rapidfire::Questions::Short", question_text: "What is the closest TTC subway station to York U?", position: nil, answer_options: "Union\r\nFinch\r\nVictoria Park\r\nDownsview", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 4, correct_answer_text: "Downsview")
questions << Rapidfire::Question.create(question_group_id: 1, type: "Rapidfire::Questions::Checkbox", question_text: "What is Toronto's newest university?", position: nil, answer_options: "Ryerson\r\nYork\r\nUniversity of Toronto\r\nOntario college of art and design", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 5, correct_answer_text: "Ontario college of art and design")
questions << Rapidfire::Question.create(question_group_id: 1, type: "Rapidfire::Questions::Numeric", question_text: "When is the York U subway currently scheduled to open", position: nil, answer_options: "2017\r\n2018\r\n2021\r\n2019", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 6, correct_answer_text: "2017")
# --------- LASSONDE ----------
#Question Groups
question_groups = []
question_groups << Rapidfire::QuestionGroup.create(name: "Lassonde")
#Questions & Solutions
questions = []
solutions = []
questions << Rapidfire::Question.create(question_group_id: 2, type: "Rapidfire::Questions::Select", question_text: "What year was Lassonde school Founded?", position: nil, answer_options: "2010\r\n2012\r\n2014\r\n2016", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 7, correct_answer_text: "2012")
questions << Rapidfire::Question.create(question_group_id: 2, type: "Rapidfire::Questions::Short", question_text: "Lassonde hosts Canada's only program in this discipline", position: nil, answer_options: "Electrical engineering\r\nDigital media\r\nSpace engineering\r\nCivil engineering", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 8, correct_answer_text: "Space engineering")
questions << Rapidfire::Question.create(question_group_id: 2, type: "Rapidfire::Questions::Radio", question_text: "Who is Lassonde student government's social director?", position: nil, answer_options: "Amal\r\nMohammed\r\nShenalie\r\nthis does not exist", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 9, correct_answer_text: "Amal")
questions << Rapidfire::Question.create(question_group_id: 2, type: "Rapidfire::Questions::Short", question_text: "The new home of Lassonde school of engineering is called...", position: nil, answer_options: "Lassonde building\r\nBergeron Centre for Engineering Excellence\r\npetrie science building\r\nsteacie science building", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 10, correct_answer_text: "Bergeron Centre for Engineering Excellence")
questions << Rapidfire::Question.create(question_group_id: 2, type: "Rapidfire::Questions::Checkbox", question_text: "Who is the dean of Lassonde", position: nil, answer_options: "Nataly Sheinin\r\nElie morrison\r\nHisham siddiq\r\nJanusz Kozinski", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 11, correct_answer_text: "Janusz Kozinski")
questions << Rapidfire::Question.create(question_group_id: 2, type: "Rapidfire::Questions::Numeric", question_text: "There are lassonde student government members who are leaders for weekzero, true or false", position: nil, answer_options: "true\r\nfalse", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 12, correct_answer_text: "true")
# --------- YORK U ----------
#Question Groups
question_groups = []
question_groups << Rapidfire::QuestionGroup.create(name: "York University")
#Questions & Solutions
questions = []
solutions = []
questions << Rapidfire::Question.create(question_group_id: 3, type: "Rapidfire::Questions::Select", question_text: "What year was York University Founded?", position: nil, answer_options: "1959\r\n1960\r\n1961\r\n1962", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 13, correct_answer_text: "1959")
questions << Rapidfire::Question.create(question_group_id: 3, type: "Rapidfire::Questions::Short", question_text: "What is the founding (first) college of york University", position: nil, answer_options: "Founders\r\nBethune\r\nGlendon\r\nWinters", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 14, correct_answer_text: "Glendon")
questions << Rapidfire::Question.create(question_group_id: 3, type: "Rapidfire::Questions::Radio", question_text: "What is the York University Mascot?", position: nil, answer_options: "Tiger\r\nDragon\r\nLion\r\nSpider", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 15, correct_answer_text: "Lion")
questions << Rapidfire::Question.create(question_group_id: 3, type: "Rapidfire::Questions::Short", question_text: "At which place can you get gym (weight room) membership for 15 dollars per year", position: nil, answer_options: "Seneca\r\nTait Mckenzie\r\nYFS\r\nAtkinson", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 16, correct_answer_text: "Tait Mckenzie")
questions << Rapidfire::Question.create(question_group_id: 3, type: "Rapidfire::Questions::Checkbox", question_text: "The main food court is located in this building", position: nil, answer_options: "Stong basement\r\nAtkinson basement\r\nLassonde lobby\r\nStudent centre", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 17, correct_answer_text: "Student centre")
questions << Rapidfire::Question.create(question_group_id: 3, type: "Rapidfire::Questions::Numeric", question_text: "What is the newest frosh week to happen on campus?", position: nil, answer_options: "Bethune\r\nLassonde\r\nNewCollege\r\nSchulich", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 18, correct_answer_text: "Lassonde")


# --------- EARTH SPACE SCIENCE ENGINEERING----------
#Question Groups
question_groups = []
question_groups << Rapidfire::QuestionGroup.create(name: "Earth-Space Science Eng")
#Questions & Solutions
questions = []
solutions = []
questions << Rapidfire::Question.create(question_group_id: 4, type: "Rapidfire::Questions::Select", question_text: "Volcanoes occur as a result of...", position: nil, answer_options: "motion and collision of tectonic plates\r\nextra heat in the surface of the earth\r\nthe changing speed of the planet's rotation around the sun\r\nthe changing distance of stars from the earth", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 19, correct_answer_text: "motion and collision of tectonic plates")
questions << Rapidfire::Question.create(question_group_id: 4, type: "Rapidfire::Questions::Short", question_text: "At midlatitudes (not near equators or poles) we have four distinct seasons because....", position: nil, answer_options: "The equator is not around the centre of Earth\r\nThe sun's output of heat changes annually \r\nThe north-south axis of earth is tilted with respect to its orbit about the sun\r\nplanet earth shrinks and grows on the order of centimetres annually", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 20, correct_answer_text: "The north-south axis of earth is tilted with respect to its orbit about the sun")
questions << Rapidfire::Question.create(question_group_id: 4, type: "Rapidfire::Questions::Radio", question_text: "What causes weather systems to move through regions so that the weather changes daily", position: nil, answer_options: "strong winds of the jet stream located about the altitude of commercial flights carry weather systems around the world \r\nThe warming and cooling of ocean temperatures\r\nThe orbit of Earth about the sun\r\nnone of the above", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 21, correct_answer_text: "strong winds of the jet stream located about the altitude of commercial flights carry weather systems around the world")
questions << Rapidfire::Question.create(question_group_id: 4, type: "Rapidfire::Questions::Short", question_text: "The temperature and physical state of the material inside of the earth is the same from below the surface to the core of the earth, true or false", position: nil, answer_options: "true\r\nfalse because temperature cools as your go closer to the centre of earth\r\nfalse because temperature gets hotter as you get closer to centre of earth\r\nnone of the above", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 22, correct_answer_text: "false because temperature gets hotter as you get closer to centre of earth")
questions << Rapidfire::Question.create(question_group_id: 4, type: "Rapidfire::Questions::Checkbox", question_text: "Planets orbit in a circle about the sun...", position: nil, answer_options: "Yes all of them do\r\nThe inner planets do, Mercury, Venus, Earth, Mars, but not the outer planets\r\nThe outer planets do, Jupiter, Saturn,Uranus, Neptune, but not the inner plannets\r\nNo they do not", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 23, correct_answer_text: "No they do not")
questions << Rapidfire::Question.create(question_group_id: 4, type: "Rapidfire::Questions::Numeric", question_text: "Lightning strikes are hotter than...", position: nil, answer_options: "900 degrees Kelvin\r\nthe surface of the sun\r\nthe temperature on Tuesday at the tennis centre\r\nall of the above", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 24, correct_answer_text: "all of the above")
# 

# --------- CIVIL AND MECHANICAL ENGINEERING----------
#Question Groups
question_groups = []
question_groups << Rapidfire::QuestionGroup.create(name: "Civil and Mechanical Eng")
#Questions & Solutions
questions = []
solutions = []
questions << Rapidfire::Question.create(question_group_id: 5, type: "Rapidfire::Questions::Select", question_text: "Gravity accelerates at this value, rounded to the first decimal place...", position: nil, answer_options: "9.8 m/s^2\r\n6.7 m/s^2\r\n12.0 m/s^2\r\n4.9 m/s^2", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 25, correct_answer_text: "9.8 m/s^2")
questions << Rapidfire::Question.create(question_group_id: 5, type: "Rapidfire::Questions::Short", question_text: "Electrical charges that are attracted to each other are...", position: nil, answer_options: "opposite or same, it does not matter\r\nsame \r\nnone of the options\r\nopposite", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 26, correct_answer_text: "opposite")
questions << Rapidfire::Question.create(question_group_id: 5, type: "Rapidfire::Questions::Radio", question_text: "some branches of civil engineering include...", position: nil, answer_options: "mechanical  electrical  software \r\nconstruction  structural  transportation  environmental\r\nspacecraft  solid-earth  computer\r\nall of the above", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 27, correct_answer_text: "construction  structural  transportation  environmental")
questions << Rapidfire::Question.create(question_group_id: 5, type: "Rapidfire::Questions::Short", question_text: "Finish the sentence. In rotating systems, such as a merry go round, with increasing distance from the centre, force....", position: nil, answer_options: "increases\r\nstays the same\r\ndecreases\r\nis also dependent on velocity of rotation not just distance from centre", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 28, correct_answer_text: "is also dependent on velocity of rotation not just distance from centre")
questions << Rapidfire::Question.create(question_group_id: 5, type: "Rapidfire::Questions::Checkbox", question_text: "In order to study engineering, according to York U GPA system out of 9.0, students must maintain an overall average GPA higher than ...", position: nil, answer_options: "3.0\r\n4.0\r\n6.0\r\n7.0", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 29, correct_answer_text: "4.0")
questions << Rapidfire::Question.create(question_group_id: 5, type: "Rapidfire::Questions::Numeric", question_text: "Gravitational force is the strongest type of  force among the following list, gravitational, electric, magnetic", position: nil, answer_options: "it is the strongest\r\nit is not the strongest but not the weakest\r\nnone of these 4 options apply\r\nit is the weakest", validation_rules: {:presence=>"1", :minimum=>"", :maximum=>"", :greater_than_or_equal_to=>"", :less_than_or_equal_to=>""})
solutions << Solution.create!(question_id: 30, correct_answer_text: "it is the weakest")
# 