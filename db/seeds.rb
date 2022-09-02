# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Creating categories..."
puts "creating fitness category"
Category.create!(
  title: "Fitness",
  explanation: "Physical fitness is a state of health and well-being and, more specifically, the ability to perform aspects of sports, occupations and daily activities. Physical fitness is generally achieved through proper nutrition, moderate-vigorous physical exercise, and sufficient rest along with a formal recovery plan.
  Before the Industrial Revolution, fitness was defined as the capacity to carry out the day's activities without undue fatigue or lethargy. However, with automation and changes in lifestyles, physical fitness is now considered a measure of the body's ability to function efficiently and effectively in work and leisure activities, to be healthy, to resist hypokinetic diseases, improve immune system and to meet emergency situations.",
  icon: "<i class='fa-solid fa-dumbbell'></i>",
  capacity_type: "People",
  img: "fitness.png"
)
puts "creating climbing category"
Category.create!(
  title: "Climbing",
  explanation: "Climbing is the activity of using one's hands, feet, or any other part of the body to ascend a steep topographical object. It is done for locomotion, recreation and competition, and within trades that rely on ascension; such as emergency rescue and military operations. It is done indoors and out, on natural and man-made structures.
  Professional mountain guides or rock climbing guides, such as members of the IFMGA, have been known to be a historically significant element of developing the popularity of the sport in the natural environment, and remain so today.",
  icon: "<i class='fa-solid fa-mountain-sun'></i>",
  capacity_type: "People",
  img: "climbing.png"
)
puts "creating MMA category"
Category.create!(
  title: "MMA",
  explanation: "Mixed martial arts (MMA), sometimes referred to as cage fighting, no holds barred (NHB), and ultimate fighting, and originally referred to as Vale Tudo is a full-contact combat sport based on striking, grappling and ground fighting, incorporating techniques from various combat sports from around the world. The first documented use of the term mixed martial arts was in a review of UFC 1 by television critic Howard Rosenberg in 1993. The question of who actually coined the term is subject to debate.
  During the early 20th century, various interstylistic contests took place throughout Japan and in the countries of the Four Asian Tigers.",
  icon: "<i class='fa-solid fa-hand-fist'></i>",
  capacity_type: "People",
  img: "mma.png"
)
puts "creating volleyball category"
Category.create!(
  title: "Volleyball",
  explanation: "Volleyball is a team sport in which two teams of six players are separated by a net. Each team tries to score points by grounding a ball on the other team's court under organized rules. It has been a part of the official program of the Summer Olympic Games since Tokyo 1964. Beach volleyball was introduced to the programme at the Atlanta 1996. The adapted version of volleyball at the Summer Paralympic Games is sitting volleyball.",
  icon: "<i class='fa-solid fa-volleyball'></i>",
  capacity_type: "Courts",
  img: "volleyball.png"
)
puts "creating swimming category"
Category.create!(
  title: "Swimming",
  explanation: "Swimming is the self-propulsion of a person through water, or other liquid, usually for recreation, sport, exercise, or survival. Locomotion is achieved through coordinated movement of the limbs and the body to achieve hydrodynamic thrust which results in directional motion. Humans can hold their breath underwater and undertake rudimentary locomotive swimming within weeks of birth, as a survival response.",
  icon: "<i class='fa-solid fa-person-swimming'></i>",
  capacity_type: "People",
  img: "swimming.png"
)
puts "creating badminton category"
Category.create!(
  title: "Badminton",
  explanation: "Badminton is a racquet sport played using racquets to hit a shuttlecock across a net. Although it may be played with larger teams, the most common forms of the game are 'singles' (with one player per side) and 'doubles' (with two players per side). Badminton is often played as a casual outdoor activity in a yard or on a beach; formal games are played on a rectangular indoor court. Points are scored by striking the shuttlecock with the racquet and landing it within the opposing side's half of the court.",
  icon: "<i class='fa-solid fa-table-tennis-paddle-ball'></i>",
  capacity_type: "Courts",
  img: "badminton.png"
)

Faker::Config.locale = 'de'
Facility.destroy_all
puts "Creating facilities..."
20.times do |i|
  facility = Facility.create!(
    name: Faker::TvShows::HeyArnold.location,
    description: Faker::TvShows::Friends.quote,
    address: Faker::Address.street_name,
    capacity: rand(20..50),
    category_id: rand(1..6),
    picture: "https://images.unsplash.com/photo-1534438327276-14e5300c3a48?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"
  )
  puts "#{i + 1}. #{facility.name}"
end

puts "Creating Jan..."
User.create!(
  email: "jan@test.com",
  password: "123456",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name
)
puts "Creating Pam..."
User.create!(
  email: "pam@test.com",
  password: "123456",
  first_name: "Pam",
  last_name: "Reif"
)

puts "Creating bookings for Pam..."
puts "...this takes a few seconds..."
1000.times do |i|
  booking = Booking.create!(
    comment: Faker::TvShows::NewGirl.quote,
    start_time: Faker::Date.backward(days: 14),
    end_time: Faker::Date.backward(days: 14),
    user_id: 2,
    facility_id: rand(1..20),
    checked_in: [true, false].sample
  )
end

puts "Create bookings for Jan..."
5.times do |i|
  booking = Booking.create!(
    comment: Faker::TvShows::NewGirl.quote,
    start_time: Faker::Date.backward(days: 14),
    end_time: Faker::Date.backward(days: 14),
    user_id: 1,
    facility_id: rand(1..20),
    checked_in: [true, false].sample
  )
end
puts "Finished!"
