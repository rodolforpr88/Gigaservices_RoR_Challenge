require "faker"

FactoryBot.define do
  factory :user do
    avatar { nil }
    gender { Faker::Number.between(from: 0, to: 2) }
    title { Faker::Number.between(from: 0, to: 3) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
  end

  trait :with_avatar do
    after :build do |user|
      file_name = "model.png"
      file_path = Rails.root.join("spec", "fixtures", "files", file_name)
      user.avatar.attach(io: File.open(file_path), filename: file_name)
    end
  end
end
