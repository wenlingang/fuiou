# frozen_string_literal: true

require 'fuiou/result'
require 'fuiou/service'
require 'fuiou/sign'
require 'fuiou/version'

module Fuiou
  class << self
    # mch_id 商户号
    # ins_id 机构号
    # ins_private_key 机构号私钥
    # ins_public_key 机构号公钥
    # notify_url 回调通知地址
    # fuiou_21_url 统一下单地址
    # fuiou_30_url 订单查询地址
    # his_trade_query_url 历史交易查询地址
    attr_accessor :mch_id, :notify_url
    attr_accessor :ins_id, :ins_private_key, :ins_public_key
    attr_accessor :fuiou_21_url, :fuiou_30_url, :his_trade_query_url, :wx_pre_create_url
  end
end
