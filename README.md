# Fuiou

Unofficial Fuiou ruby gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fuiou'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install fuiou

## Usage

```ruby
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

resp = Fuiou::Service.invoke_pre_create(params)

query_params = {
  version: "1",
  ins_cd: "08A9999999",
  mchnt_cd: "0002900F0370542",
  term_id: "12345678",
  order_type: "ALIPAY",
  mchnt_order_no: "2021071114412625524",
  random_str: "a40b25ddbe20cb5a598209baea31632a",
}

query_resp = Fuiou::Service.invoke_common_query(query_params)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).
