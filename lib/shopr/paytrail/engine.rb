module Shopr
  module Paytrail
    class Engine < Rails::Engine
      config.before_initialize do
        config.i18n.load_path += Dir["#{config.root}/config/locales/**/*.yml"]
      end

      initializer 'shopr.paytrail.initializer' do
        Shopr::Paytrail.setup
      end

      config.to_prepare do
        Shopr::Order.send :include, Shopr::Paytrail::OrderExtensions
      end
    end
  end
end
