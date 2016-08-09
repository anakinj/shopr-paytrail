module Shopr
  module Paytrail
    module OrderExtensions
      def redirect_to_paytrail(success_url, failure_url, notification_url)
        response = PaytrailClient::Payment.create(order_number: number,
                                                  currency: 'EUR',
                                                  locale: resolve_locale,
                                                  url_set: {
                                                    success: success_url,
                                                    failure: failure_url,
                                                    notification: notification_url
                                                  },
                                                  price: format('%.2f', total))

        response['url']
      rescue
        raise Shopr::Errors::PaymentDeclined
      end

      def handle_paytrail_payment(params, confirmed = false)
        PaytrailClient::Payment.verify_payment!(params['ORDER_NUMBER'],
                                                params['TIMESTAMP'],
                                                params['PAID'],
                                                params['METHOD'],
                                                params['RETURN_AUTHCODE'])

        payment = payments.find_by(reference: params['ORDER_NUMBER'])

        if payment.nil?
          payments.create(amount:     total,
                          reference:  params['ORDER_NUMBER'],
                          method:     'Paytrail',
                          refundable: false,
                          confirmed:  confirmed)
        else
          payment.update_attribute(:confirmed, confirmed)
        end

        save!
      rescue
        raise Shopr::Errors::PaymentDeclined, 'Could not verify Paytrail payment'
      end

      def resolve_locale
        case I18n.locale
        when :fi
          'fi_FI'
        when :sv
          'sv_SE'
        else
          'en_US'
        end
      end
    end
  end
end
