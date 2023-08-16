# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create Resorts
resort = Resort.create!(
  name: 'Resort Name',
  address: '123 Main Street',
  description: 'A beautiful resort...',
  phone_number: '123-456-7890',
  email: 'info@example.com',
  city: 'City Name',
  country: 'Country Name',
  available_rooms: 100,
  max_occupancy: 2,
  base_price: 150.00
)

# Create a Booking for the Resort and User
Booking.create!(
  user:,
  resort:,
  selected_date: '2023-08-16',
  selected_city: 'City Name'
)
