# no db table for this model

class Payment
  include OrdersHelper

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  # attributes: amount, order_id are required  to create a new payment
  attr_accessor :amount, :order_id, :quantity, :currency, :subject, :body
  
  # the order that this payment is for
  scope :order, lambda do |order_id|
    Order.find(order_id)
  end
  
  validates_numericality_of :amount, :greater_than => 0

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
  
  
  def currency
    return OrdersHelper.get_currency_name(self.currency)
  end
  
  # title of payment / order...
  def subject
    return self.order(self.order_id).order_goods[0].order_item_info_str
  end
  
  # description for the payment or order
  def body
    return ""
  end 

end
