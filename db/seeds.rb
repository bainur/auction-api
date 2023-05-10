# membuat user
User.create!(
  email: Faker::Internet.email,
  name: Faker::Name.name,
  username: "user1",
  password: 'password'
)

User.create!(
  email: Faker::Internet.email,
  name: Faker::Name.name,
  username: "user2",
  password: 'password'
)

# membuat item
20.times do
  Item.create!(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price(range: 50..1000),
    bid: Faker::Number.between(from: 1, to: 10),
    start_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    end_time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 30)
  )
end