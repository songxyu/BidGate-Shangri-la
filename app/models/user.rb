class User < ActiveRecord::Base
  belongs_to :company
 
  has_many :sell_orders, :class_name => "Order", :foreign_key => 'seller_id' #, dependent: :destroy
  has_many :buy_orders, :class_name => "Order", :foreign_key => 'buyer_id' #, dependent: :destroy
  
  has_many :bid_histories, :class_name => "OrderPriceHistory", :foreign_key => 'buyer_id' 
 
  attr_accessible :nickname, :status, :user_type, :company_id
end
