
require 'uri'
require 'net/https'
require 'json'

module GithubApi
  def self.request(repo, type, ref, token)
    uri   = URI("https://api.github.com/repos/#{repo}/git/refs/#{type}/#{ref}")

    http              = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl      = true
    http.verify_mode  = OpenSSL::SSL::VERIFY_PEER

    request = Net::HTTP::Get.new(uri.request_uri)

    request['Authorization']  = "token #{token}"
    request['User-Agent']     = "Puppet"
  
    response = http.request(request)

    if response.code.to_i != 200
      raise Puppet::ParseError, "GithubApi -- URI: #{uri},  Code: #{response.code}, Message: #{response.message}"
    else
      JSON.load(response.body)['object']['sha']
    end
  rescue SocketError => e
    raise Puppet::ParseError, "Github Api network error: #{e.message}" 
  end
end
  

