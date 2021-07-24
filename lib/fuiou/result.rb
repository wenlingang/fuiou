# frozen_string_literal: true

require 'cgi'
require 'active_support/core_ext/hash/conversions'

module Fuiou
  module Result
    class << self
      def parse(req)
        Hash.from_xml(CGI.unescape(req))["xml"]
      end
    end
  end
end
