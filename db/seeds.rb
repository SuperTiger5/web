User.create!(name: "Sample User",
             email: "admin@email.com",
             admin: true,
             password: "password",
             password_confirmation: "password")
              
99.times do |n|
  name = Faker::Name.name
  email = "sample#{n+1}@email.com"
  password = "password"
  User.create!(name:  name,
               email:  email,
               password: password,
               password_confirmation: password
        )
end

p "Userデータ作成完了！"

