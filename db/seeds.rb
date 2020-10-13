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

10.times do |n|
  name = Faker::Name.name
  email = "sample#{n+101}@email.com"
  password = "password"
  work_place_of_user = "大阪"
  employment_status = "アルバイト"
  User.create!(name:  name,
              email:  email,
              work_place_of_user: work_place_of_user,
              employment_status: employment_status,
              password: password,
              password_confirmation: password
        )
end

10.times do |n|
  name = Faker::Name.name
  email = "sample#{n+111}@email.com"
  password = "password"
  work_place_of_user = "東京"
  employment_status = "フリーランス"
  User.create!(name:  name,
              email:  email,
              work_place_of_user: work_place_of_user,
              employment_status: employment_status,
              password: password,
              password_confirmation: password
        )
end

10.times do |n|
  name = Faker::Name.name
  email = "sample#{n+121}@email.com"
  password = "password"
  work_place_of_user = "名古屋"
  employment_status = "契約社員"
  User.create!(name:  name,
              email:  email,
              work_place_of_user: work_place_of_user,
              employment_status: employment_status,
              password: password,
              password_confirmation: password
        )
end

10.times do |n|
  name = Faker::Name.name
  email = "sample#{n+131}@email.com"
  password = "password"
  work_place_of_user = "名古屋"
  employment_status = "派遣社員"
  User.create!(name:  name,
              email:  email,
              work_place_of_user: work_place_of_user,
              employment_status: employment_status,
              password: password,
              password_confirmation: password
        )
end

10.times do |n|
  name = Faker::Name.name
  email = "sample#{n+141}@email.com"
  password = "password"
  work_place_of_user = "大阪"
  employment_status = "正社員"
  occupation = "事務員"
  User.create!(name:  name,
              email:  email,
              work_place_of_user: work_place_of_user,
              employment_status: employment_status,
              occupation: occupation,
              password: password,
              password_confirmation: password
        )
end

p "従業員データ作成完了！"

