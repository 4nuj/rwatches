# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Find an existing user by their ID
# User.destroy_all
# # creating new user
# user1 = user = User.create(email: 'a1@t1.com', password: 'password', first_name: 'anuj', last_name: 'tyagi')
# user2 = user = User.create(email: 'a2@t2.com', password: 'password', first_name: 'a2', last_name: 't2')
# user3 = user = User.create(email: 'a3@t3.com', password: 'password', first_name: 'a3', last_name: 't3')
# user4 = user = User.create(email: 'a4@t5.com', password: 'password', first_name: 'a4', last_name: 't4')
# user5 = user = User.create(email: 'a5@t5.com', password: 'password', first_name: 'a5', last_name: 't5')

# # Create and save 5 new watches associated with the user

# # Create and save 5 new watches associated with the user
# watch1 = user1.watches.create(brand: 'Rolex', model: 'Submariner', description: 'The Rolex Submariner is a classic dive watch that has been a favorite of watch enthusiasts for decades. This stainless steel watch features a black dial and bezel, and is water resistant to 300 meters.', price: 1000, address: '123 Main St')
# watch2 = user2.watches.create(brand: 'Omega', model: 'Speedmaster', description: 'The Omega Speedmaster is known as the "moon watch" because it was worn by astronauts on the Apollo missions to the moon. This watch features a chronograph function and a black dial with white indices.', price: 2000, address: '456 Oak St')
# watch3 = user3.watches.create(brand: 'Cartier', model: 'Tank', description: 'The Cartier Tank is a timeless watch that has been worn by style icons like Jacqueline Kennedy and Princess Diana. This gold watch features a rectangular case and a leather strap.', price: 3000, address: '789 Elm St')
# watch4 = user4.watches.create(brand: 'Patek Philippe', model: 'Nautilus', description: 'The Patek Philippe Nautilus is a luxury sports watch that features a distinctive porthole design. This steel watch has a blue dial with luminescent hands and indices.', price: 4000, address: '321 Maple St')
# watch5 = user5.watches.create(brand: 'Audemars Piguet', model: 'Royal Oak', description: 'The Audemars Piguet Royal Oak is another iconic luxury sports watch that features a hexagonal bezel and an integrated bracelet. This rose gold watch has a brown dial with a tapisserie pattern.', price: 5000, address: '654 Pine St')

# # Output a message indicating the number of watches created
# puts "Created #{Watch.count} watches"

# # Output a message indicating the number of watches created
