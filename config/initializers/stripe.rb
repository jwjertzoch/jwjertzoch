if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_8S1mMI0zqf6Bi6Fr3j95OBXV',
    secret_key: 'sk_test_sONmcMDvMDTzLcPps7xBOcI9'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
