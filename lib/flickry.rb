#require 'flickraw'
require 'httparty'
require 'super_struct'

require 'flickry/base'
require 'flickry/location'
require 'flickry/tag'
require 'flickry/person'
require 'flickry/comment'
require 'flickry/size'
require 'flickry/sizes'
require 'flickry/license'
require 'flickry/photo'

module Flickry
  VERSION='0.3.0'

  FLICKR_HOST='api.flickr.com'.freeze

  # Path of flickr REST API
  REST_PATH='/services/rest/?'.freeze

  # Path of flickr auth page
  AUTH_PATH='/services/auth/?'.freeze

  # Path of flickr upload
  UPLOAD_PATH='/services/upload/'.freeze

  class Flickr
    include HTTParty
    base_uri FLICKR_HOST
  
    def initialize # :nodoc:
    end
    
    def authorize(args={})
      full_args = {:api_key => Flickry.api_key, :perms => 'read'}
      args.each {|k, v| full_args[k.to_sym] = v }
      full_args[:api_sig] = Flickry.api_sig(full_args) if Flickry.shared_secret
      url = 'http://' + Flickry::FLICKR_HOST + Flickry::AUTH_PATH + full_args.collect { |a, v| "#{a}=#{v}" }.join('&')
      puts url
      self.class.get(url)
    end
  end

  class << self
    # Your flickr API key, see http://www.flickr.com/services/api/keys for more information
    attr_accessor :api_key

    # The shared secret of _api_key_, see http://www.flickr.com/services/api/keys for more information
    attr_accessor :shared_secret


    # Returns the signature of hsh. This is meant to be passed in the _api_sig_ parameter.
    def api_sig(hsh)
      MD5.md5(Flickry.shared_secret + hsh.sort{|a, b| a[0].to_s <=> b[0].to_s }.flatten.join).to_s
    end
  end
end
