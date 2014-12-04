Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_3VnrXFBGIR0MGiKoT0A6iDP8'],
  :secret_key      => ENV['sk_test_vbEIBXIHA30DJhuF9GEkiDus']
}

Stripe.api_key = Rails.configuration.stripe['sk_test_vbEIBXIHA30DJhuF9GEkiDus']