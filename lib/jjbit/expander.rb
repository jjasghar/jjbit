require "net/https"
require "cgi"
require "json"


module Jjbit
  class Expander

    attr_reader :token

    def initialize(token)
      @token = token
    end

    def expand(url)
      raise NotAUrl unless url =~ URI.regexp
      raise NotAnHTTP, "Not an HTTP" unless httpchecker(url)

      uri = URI.parse("https://api-ssl.bitly.com/v3/expand?access_token=#{token}&shortUrl=#{escape(url)}")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      JSON.parse(response.body)["data"]["expand"][0]["long_url"]
    end


    private

    def escape(url)
      CGI.escape(url.to_s)
    end

    def httpchecker(url)
      %w[http https].include?(URI.parse(url).scheme)
    end

  end

  class NotAUrl < StandardError
  end

  class NotAnHTTP < StandardError
  end


end
