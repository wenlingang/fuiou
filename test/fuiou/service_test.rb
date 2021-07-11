# frozen_string_literal: true

require 'test_helper'

class ServiceTest < MiniTest::Test
  def test_invoke_pre_create
    params = {
      curr_type: "",
      mchnt_cd: "0002900F0370542",
      goods_des: "djkfkas",
      reserved_fy_term_type: "",
      reserved_hb_fq_seller_percent: "",
      mchnt_order_no: "#{Time.now.strftime("%Y%m%d%H%M%S")}#{rand(100000)}",
      goods_tag: "",
      reserved_expire_minute: "",
      random_str: SecureRandom.hex,
      order_type: "ALIPAY",
      ins_cd: "08A9999999",
      txn_begin_ts: Time.now.strftime("%Y%m%d%H%M%S"),
      reserved_fy_term_id: "",
      reserved_fy_term_sn: "",
      term_id: "12345678",
      reserved_limit_pay: "",
      notify_url: "http://www.wrx.cn",
      reserved_hb_fq_num: "",
      version: "1",
      goods_detail: "asasda",
      reserved_device_info: "",
      addn_inf: "144333,95025",
      order_amt: "1",
      reserved_sub_appid: "",
      term_ip: "127.0.0.1"
    }

    response_body = "%3C%3Fxml+version%3D%221.0%22+encoding%3D%22GBK%22+standalone%3D%22yes%22%3F%3E%3Cxml%3E%3Cins_cd%3E08A9999999%3C%2Fins_cd%3E%3Cmchnt_cd%3E0002900F0370542%3C%2Fmchnt_cd%3E%3Corder_type%3EALIPAY%3C%2Forder_type%3E%3Cqr_code%3Ehttps%3A%2F%2Fqr.alipay.com%2Fbax06313qu87v9btinki008f%3C%2Fqr_code%3E%3Crandom_str%3ETG0APYN6F58PFZDVL6A0QCK7KPO2V81G%3C%2Frandom_str%3E%3Creserved_addn_inf%3E144333%2C95025%3C%2Freserved_addn_inf%3E%3Creserved_channel_order_id%3E%3C%2Freserved_channel_order_id%3E%3Creserved_fy_order_no%3E%3C%2Freserved_fy_order_no%3E%3Creserved_fy_trace_no%3E070305690151%3C%2Freserved_fy_trace_no%3E%3Cresult_code%3E000000%3C%2Fresult_code%3E%3Cresult_msg%3ESUCCESS%3C%2Fresult_msg%3E%3Csession_id%3E%3C%2Fsession_id%3E%3Csign%3Ed40CAB86Tw5HGOb%2FoVhsagF%2FL3S4STxksXFHWgzWsUmgMTfDyfA9GCtRAWjuhAkHXOtETJbc6k8u%2FPDbNFA9FGsSdlblgT4rlFPZx3JymSjKrVap5UG0AvV9Cqkd%2FikyeM0cXFR%2FCGuTLdFPoHcQZARiEJxdyzJw5DT8CgaQ9aU%3D%3C%2Fsign%3E%3Cterm_id%3E%3C%2Fterm_id%3E%3C%2Fxml%3E"

    stub_request(:post, "https://fundwx.fuiou.com/preCreate").to_return(body: response_body)

    resp = Fuiou::Service.invoke_pre_create(params)

    assert_equal resp["result_code"], "000000"
    assert_equal resp["result_msg"], "SUCCESS"
  end

  def test_invoke_common_query
    params = {
      version: "1",
      ins_cd: "08A9999999",
      mchnt_cd: "0002900F0370542",
      term_id: "12345678",
      order_type: "ALIPAY",
      mchnt_order_no: "2021071114412625524",
      random_str: "a40b25ddbe20cb5a598209baea31632a",
    }

    response_body = "%3C%3Fxml+version%3D%221.0%22+encoding%3D%22GBK%22+standalone%3D%22yes%22%3F%3E%3Cxml%3E%3Caddn_inf%3E144333%2C95025%3C%2Faddn_inf%3E%3Cbuyer_id%3E%3C%2Fbuyer_id%3E%3Cins_cd%3E08A9999999%3C%2Fins_cd%3E%3Cmchnt_cd%3E0002900F0370542%3C%2Fmchnt_cd%3E%3Cmchnt_order_no%3E2021071114412625524%3C%2Fmchnt_order_no%3E%3Corder_amt%3E1%3C%2Forder_amt%3E%3Corder_type%3EALIPAY%3C%2Forder_type%3E%3Crandom_str%3E07DM9GMV5D1ILN4DS2IO3XO7TLOQMJOJ%3C%2Frandom_str%3E%3Creserved_buyer_logon_id%3E%3C%2Freserved_buyer_logon_id%3E%3Creserved_channel_order_id%3E%3C%2Freserved_channel_order_id%3E%3Creserved_coupon_fee%3E%3C%2Freserved_coupon_fee%3E%3Creserved_fund_bill_list%3E%3C%2Freserved_fund_bill_list%3E%3Creserved_fy_settle_dt%3E20210711%3C%2Freserved_fy_settle_dt%3E%3Creserved_fy_trace_no%3E070305690154%3C%2Freserved_fy_trace_no%3E%3Creserved_is_credit%3E%3C%2Freserved_is_credit%3E%3Creserved_txn_fin_ts%3E%3C%2Freserved_txn_fin_ts%3E%3Cresult_code%3E000000%3C%2Fresult_code%3E%3Cresult_msg%3ESUCCESS%3C%2Fresult_msg%3E%3Csign%3EPoJfrxcCg8UqoBy6Mx69oVekY4UOFh4KyG%2Fsfo2d%2BbRBWVxkMiS7hg4J%2Ftl7Qc%2FMYwImlobTkGdZYKqDv4BysGR7E7REsRwyWjsaVaPb%2BAIQMQAe2APTc3wdwiokqMU%2BQDRKHMOZiL7WeOpxkuQFRMpX1IMTYC0jpapcAbRyEJE%3D%3C%2Fsign%3E%3Cterm_id%3E%3C%2Fterm_id%3E%3Ctrans_stat%3ENOTPAY%3C%2Ftrans_stat%3E%3Ctransaction_id%3E%3C%2Ftransaction_id%3E%3C%2Fxml%3E"

    stub_request(:post, "https://fundwx.fuiou.com/commonQuery").to_return(body: response_body)

    resp = Fuiou::Service.invoke_common_query(params)

    assert_equal resp["result_code"], "000000"
    assert_equal resp["result_msg"], "SUCCESS"
  end
end
