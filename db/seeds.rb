User.create!(name: "Sample User",
             email: "admin@email.com",
             work_place_of_user: "大阪",
             admin: true,
             password: "password",
             password_confirmation: "password")


33.times do |n| #0～32
  name = Faker::Name.name
  email = "sample#{n+2}@email.com"
  password = "password"
  work_place_of_user = "大阪"
  User.create!(name:  name,
              email:  email,
              work_place_of_user: work_place_of_user,
              password: password,
              password_confirmation: password
        )
end

33.times do |n| 
  name = Faker::Name.name
  email = "sample#{n+35}@email.com"
  password = "password"
  work_place_of_user = "東京"
  User.create!(name:  name,
              email:  email,
              work_place_of_user: work_place_of_user,
              password: password,
              password_confirmation: password
        )
end

33.times do |n|
  name = Faker::Name.name
  email = "sample#{n+68}@email.com"
  password = "password"
  work_place_of_user = "名古屋"
  User.create!(name:  name,
              email:  email,
              work_place_of_user: work_place_of_user,
              password: password,
              password_confirmation: password
        )
end


p "Userデータ作成完了！"

