# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Faker::Config.locale = 'de'
Facility.destroy_all
puts "Creating facilities..."
20.times do |i|
  facility = Facility.create!(
    name: Faker::TvShows::HeyArnold.location,
    description: Faker::Quotes::Shakespeare.hamlet_quote,
    address: Faker::Address.street_name,
    category: %w[Fitness Climbing MMA Volleyball Swimming Badminton].sample,
    capacity: rand(20..50),
    picture: "https://images.unsplash.com/photo-1534438327276-14e5300c3a48?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"
  )
  puts "#{i + 1}. #{facility.name}"
end

puts "Creating users..."
1.times do |i|
  user = User.create!(
    email: "jan@test.com",
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

puts "Creating bookings..."
9.times do |i|
  booking = Booking.create!(
    comment: Faker::TvShows::NewGirl.quote,
    start_time: Faker::Date.in_date_period(year: 2022, month: 8),
    end_time: Faker::Date.in_date_period(year: 2022, month: 9),
    user_id: 1,
    facility_id: 1,
    checked_in: [true, false].sample
  )
end
puts "Finished!"

