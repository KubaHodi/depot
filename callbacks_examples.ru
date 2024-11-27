class Order < ApplicationRecord
  before_validation CreditCardCallbacks.new #grouped callback
  before_validation :normalize_cedit_card_number
  after_create do |order|
    logger.info "Order #{order.id} created"
  end
  protected
  def normalize_cedit_card_number
    self.cc_number.gsub!(/[-\s]/,'')
  end
end