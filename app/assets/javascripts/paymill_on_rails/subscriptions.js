var subscription;

jQuery(function() {
  return subscription.setupForm();
});

subscription = {
  setupForm: function() {
    return $('#new_subscription').submit(function() {
      $('input[type=submit]').attr('disabled', true);
      if ($('#card_number').length) {
        subscription.processCard();
        return false;
      } else {
        return true;
      }
    });
  },
  processCard: function() {
    var card;
    card = {
      number: $('#card_number').val(),
      cvc: $('#card_code').val(),
      exp_month: $('#card_month').val(),
      exp_year: $('#card_year').val()
    };
    return paymill.createToken(card, subscription.handlePaymillResponse);
  },
  handlePaymillResponse: function(error, result) {
    if (error) {
      $('#paymill_error').text(error.apierror);
      return $('input[type=submit]').attr('disabled', false);
    } else {
      $('#subscription_paymill_card_token').val(result.token);
      return $('#new_subscription')[0].submit();
    }
  }
};

