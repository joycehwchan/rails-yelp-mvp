puts 'Destroying all restaurants...'
Restaurant.destroy_all
puts 'All restaurants are destroyed'

puts 'creating restaurant...'
50.times do
  Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    category: Restaurant::CATEGORIES.sample
  )
end
puts "created #{Restaurant.count} restaurants."

puts 'Destroying all reviews'
Review.destroy_all
puts 'All reveiws are destroyed'

puts 'creating reviews'
100.times do
  Review.create!(
    rating: rand(0..5),
    content: Faker::Restaurant.review,
    restaurant: Restaurant.find(rand(Restaurant.first.id..Restaurant.last.id))
  )
end
puts "created #{Review.count} reviews."
