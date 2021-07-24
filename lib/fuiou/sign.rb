# frozen_string_literal: true

require 'openssl'
require 'base64'
require 'cgi'

module Fuiou
  module Sign
    SIGN_TYPE_MD5 = "MD5"
    ENCODE_TYPE_GBK = "GBK"

    class << self
      def rsa_sign(rsa_string)
        rsa = OpenSSL::PKey::RSA.new(Fuiou.ins_private_key)
        sign = rsa.sign(SIGN_TYPE_MD5, rsa_string.encode(ENCODE_TYPE_GBK))
        CGI.escape(Base64.strict_encode64(sign))
      end

      def rsa_verify?(rsa_string, sign)
        rsa = OpenSSL::PKey::RSA.new(Fuiou.ins_public_key)
        rsa.verify(
          SIGN_TYPE_MD5,
          Base64.strict_decode64(CGI.unescape(sign)),
          rsa_string.encode(ENCODE_TYPE_GBK)
        )
      end
    end
  end
end
