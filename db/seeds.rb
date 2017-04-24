User.create! name: "chau giang",
  email: "1337vn@gmail.com",
  password: "chaugiang26",
  password_confirmation: "chaugiang26",
  admin: true

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create! name: name,
    email: email,
    password: password,
    password_confirmation: password
end
