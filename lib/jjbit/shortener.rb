require "net/https"
require "cgi"
require "json"

module Jjbit
  class Shortener

    attr_reader :token

    def initialize(token)
      @token = token
    end

    def shorten(url)
      raise NotAUrl unless url =~ URI.regexp

      uri = URI.parse("https://api-ssl.bitly.com/v3/shorten?access_token=#{token}&longUrl=#{escape(url)}")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      JSON.parse(response.body)["data"]["url"]
    end

    private

    def escape(url)
      CGI.escape(url.to_s)
    end

  end

  class NotAUrl < StandardError
  end

end
