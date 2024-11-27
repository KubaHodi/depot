class CreditCardCallbacks
  def before_validation(model)
    model.cc_number.gsub!(/[-\s]/, '')
  end
end