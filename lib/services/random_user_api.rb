require "uri"
require "json"
require "net/http"

class RandomUserApi
  def generate_users
    url = URI("https://randomuser.me/api/?results=30&nat=br&seed=giga&inc=gender,name,email,picture")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Content-Type"] = "application/json"

    response = https.request(request)
    JSON.parse(response.read_body)
  end
end
