require 'htauth/algorithm'
require 'digest/sha1'
require 'base64'

module HTAuth
  # Internal: an implementation of the SHA based encoding algorithm
  # as used in the apache htpasswd -s option
  #
  class Sha1 < Algorithm

    PREFIX      = '{SHA}'.freeze
    # ignore the params
    def initialize(params = {}) 
    end

    def encode(password)
      "#{PREFIX}#{Base64.encode64(::Digest::SHA1.digest(password)).strip}"
    end
  end
end
