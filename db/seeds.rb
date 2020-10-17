User.create!(name: "Admin User",
             email: "admin@email.com",
             work_place_of_user: "大阪",
             admin: true,
             password: "password",
             password_confirmation: "password")

5.times do |n|
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

5.times do |n|
  name = Faker::Name.name
  email = "sample#{n+7}@email.com"
  password = "password"
  work_place_of_user = "東京"
  User.create!(name:  name,
              email:  email,
              work_place_of_user: work_place_of_user,
              password: password,
              password_confirmation: password
        )
end

5.times do |n|
  name = Faker::Name.name
  email = "sample#{n+12}@email.com"
  password = "password"
  work_place_of_user = "名古屋"
  User.create!(name:  name,
              email:  email,
              work_place_of_user: work_place_of_user,
              password: password,
              password_confirmation: password
        )
end

5.times do |n|
  name = Faker::Name.name
  email = "sample#{n+17}@email.com"
  password = "password"
  work_place_of_user = "大阪"
  occupation = "事務員"
  User.create!(name:  name,
              email:  email,
              work_place_of_user: work_place_of_user,
              occupation: occupation,
              password: password,
              password_confirmation: password
        )
end

5.times do |n|
  name = Faker::Name.name
  email = "sample#{n+22}@email.com"
  password = "password"
  work_place_of_user = "東京"
  occupation = "事務員"
  User.create!(name:  name,
              email:  email,
              work_place_of_user: work_place_of_user,
              occupation: occupation,
              password: password,
              password_confirmation: password
        )
end

5.times do |n|
  name = Faker::Name.name
  email = "sample#{n+27}@email.com"
  password = "password"
  work_place_of_user = "名古屋"
  occupation = "事務員"
  User.create!(name:  name,
              email:  email,
              work_place_of_user: work_place_of_user,
              occupation: occupation,
              password: password,
              password_confirmation: password
        )
end


5.times do |n|
  name = Faker::Name.name
  email = "sample#{n+32}@email.com"
  password = "password"
  work_place_of_user = "大阪"
  employment_status = "契約社員"
  User.create!(name:  name,
              email:  email,
              work_place_of_user: work_place_of_user,
              employment_status: employment_status,
              password: password,
              password_confirmation: password
        )
end


5.times do |n|
  name = Faker::Name.name
  email = "sample#{n+37}@email.com"
  password = "password"
  work_place_of_user = "東京"
  employment_status = "アルバイト"
  User.create!(name:  name,
              email:  email,
              work_place_of_user: work_place_of_user,
              employment_status: employment_status,
              password: password,
              password_confirmation: password
        )
end

30.times do |n|
  name = Faker::Name.name
  email = "sample#{n+42}@email.com"
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

30.times do |n|
  name = Faker::Name.name
  email = "sample#{n+72}@email.com"
  password = "password"
  work_place_of_user = "大阪"
  employment_status = "派遣社員"
  User.create!(name:  name,
              email:  email,
              work_place_of_user: work_place_of_user,
              employment_status: employment_status,
              password: password,
              password_confirmation: password
        )
end

30.times do |n|
  name = Faker::Name.name
  email = "sample#{n+102}@email.com"
  password = "password"
  work_place_of_user = "東京"
  employment_status = "派遣社員"
  User.create!(name:  name,
              email:  email,
              work_place_of_user: work_place_of_user,
              employment_status: employment_status,
              password: password,
              password_confirmation: password
        )
end

p "従業員データ作成完了！"

