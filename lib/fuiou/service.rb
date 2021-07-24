# frozen_string_literal: true

require 'rest_client'
require 'cgi'
require 'json'
require 'active_support/core_ext/hash/conversions'

module Fuiou
  module Service
    ENCODE_TYPE_GBK = "GBK"

    class << self
      INVOKE_PRE_CREATE_REQUIRED_FIELDS = %i[version ins_cd mchnt_cd term_id random_str order_type goods_des mchnt_order_no order_amt term_ip txn_begin_ts notify_url goods_detail]
      # 主扫统一下单: https://fundwx.fuiou.com/doc/#/scanpay/api?id=_32-%e4%b8%bb%e6%89%ab%e7%bb%9f%e4%b8%80%e4%b8%8b%e5%8d%95
      def invoke_pre_create(params)
        check_required_options(params, INVOKE_PRE_CREATE_REQUIRED_FIELDS)
        payload = xmlify_payload(params)
        invoke_remote(Fuiou.fuiou_21_url, { req: payload })
      end

      INVOKE_COMMON_QUERY_REQUIRED_FIELDS = %i[version ins_cd mchnt_cd term_id order_type mchnt_order_no random_str]
      # 订单查询: https://fundwx.fuiou.com/doc/#/scanpay/api?id=_34-%e8%ae%a2%e5%8d%95%e6%9f%a5%e8%af%a2
      def invoke_common_query(params)
        check_required_options(params, INVOKE_COMMON_QUERY_REQUIRED_FIELDS)
        payload = xmlify_payload(params)
        invoke_remote(Fuiou.fuiou_30_url, { req: payload })
      end

      private

      def invoke_remote(url, payload, options = {})
        resp = RestClient.post(
          url,
          payload,
          {
            content_type: "application/x-www-form-urlencoded",
            charset: ENCODE_TYPE_GBK
          }
        )
        Fuiou::Result.parse(resp.body)
      end

      def xmlify_payload(params)
        rsa_string = params.sort.map{|k,v| "#{k}=#{v}&" unless k.start_with?("sign") || k.start_with?("reserved")}.join
        rsa_string = rsa_string.chop if rsa_string.end_with?("&")

        sign = Fuiou::Sign.rsa_sign(rsa_string)

        xml = "<?xml version=\"1.0\" encoding=\"GBK\" standalone=\"yes\"?><xml>#{params.sort.map { |k, v| "<#{k}>#{v}</#{k}>" }.join}<sign>#{sign}</sign></xml>"
        (xml.encode(ENCODE_TYPE_GBK)).encode(ENCODE_TYPE_GBK)
      end

      def check_required_options(options, names)
        names.each do |name|
          warn("Fuiou Warn: missing required option: #{name}") unless options.has_key?(name)
        end
      end      
    end
  end
end