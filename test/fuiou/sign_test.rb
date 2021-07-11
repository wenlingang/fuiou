# frozen_string_literal: true

require 'test_helper'

class Fuiou::SignTest < MiniTest::Test
  def setup
    @rsa_string = "addn_inf=144333,95025&curr_type=&goods_des=djkfkas&goods_detail=asasda&goods_tag=&ins_cd=08A9999999&mchnt_cd=0002900F0370542&mchnt_order_no=2021071113590828415&notify_url=http://www.wrx.cn&order_amt=1&order_type=ALIPAY&random_str=3af88fdf0f6702bc6b242a4222bd4d68&term_id=12345678&term_ip=127.0.0.1&txn_begin_ts=20210711135908&version=1"

    @rsa_sign = "XErbDF8QAVPyGDoYIKi0loXD51XRwcWmCl7d9yt2ymM08hqWbfRnXSYqQpiMyIzo8sG%2Fu8NUn1BiLM%2FRDFUv5F2CC0w6T4NmWfEY7lMwO4UQHL%2FF73NLMHQcabr788%2FzIcV9WgNlEpAgB3IbMltnzMxfCm3Ph5%2B8dyYQaRyDYis%3D"
  end

  def test_rsa_sign
    assert_equal @rsa_sign, Fuiou::Sign.rsa_sign(@rsa_string)
  end

  def test_rsa_verify
    assert_equal true, Fuiou::Sign.rsa_verify?(@rsa_string, @rsa_sign)
  end
end
