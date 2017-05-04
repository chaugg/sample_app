User.create! name: "chau giang",
  email: "a@b.c",
  password: "chaugiang",
  password_confirmation: "chaugiang",
  activated: true,
  activated_at: Time.zone.now,
  admin: true

20.times do |n|
  name = Faker::Name.name
  email = "e-#{n+1}@x.org"
  password = "password"
  User.create! name: name,
    email: email,
    password: password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now
end

users = User.order(:created_at).take 6
50.times do
  content = Faker::Lorem.sentence 5
  users.each {|user| user.microposts.create! content: content}
end

users = User.order(:created_at).take 6
50.times do
  content = Faker::Lorem.sentence 5
  users.each {|user| user.microposts.create! content: content}
end
