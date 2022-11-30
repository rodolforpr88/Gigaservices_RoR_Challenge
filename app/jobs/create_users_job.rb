require "services/random_user_api"
require "uri"
require "open-uri"

class CreateUsersJob < ApplicationJob
  queue_as :default

  def perform
    response = RandomUserApi.new.generate_users

    response["results"].each do |user_info|
      image = URI.open(user_info["picture"]["large"].to_s)

      User.create!(
        gender: user_info["gender"],
        title: user_info["name"]["title"],
        first_name: user_info["name"]["first"],
        last_name: user_info["name"]["last"],
        email: user_info["email"],
        avatar: { io: image, filename: user_info["picture"]["large"].match(/\d.*/).to_s }
      )
    end
  end
end
