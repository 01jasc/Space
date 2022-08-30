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
    description: Faker::Quotes::Shakespeare.hamlet_quote,
    address: Faker::Address.street_name,
    category: %w[Fitness Climbing MMA Volleyball Swimming Badminton].sample,
    capacity: rand(20..50)
  )
  puts "#{i + 1}. #{facility.capacity}"
end
puts "Finished!"
