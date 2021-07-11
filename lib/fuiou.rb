# frozen_string_literal: true

require 'fuiou/service'
require 'fuiou/sign'
require 'fuiou/version'
require 'openssl'

module Fuiou
  class << self
    # mch_id 商户号
    # ins_id 机构号
    # ins_private_key 机构号私钥
    # ins_public_key 机构号公钥
    # notify_url 回调通知地址
    attr_accessor :mch_id, :notify_url
    attr_accessor :ins_id, :ins_private_key, :ins_public_key
  end
end
