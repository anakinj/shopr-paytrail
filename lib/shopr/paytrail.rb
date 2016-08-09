require 'paytrail-client'
require 'shopr/paytrail/version'
require 'shopr/paytrail/order_extensions'
require 'shopr/paytrail/engine'

module Shopr::Paytrail
  class << self
    def setup
      Shopr.add_settings_group :paytrail, [:paytrail_merchant_id, :paytrail_merchant_secret]
    end

    def configure
      PaytrailClient.configuration do |config|
        config.merchant_id = Shopr.settings.paytrail_merchant_id
        config.merchant_secret = Shopr.settings.paytrail_merchant_secret
      end
    end
  end
end
