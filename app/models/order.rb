class Order < ActiveRecord::Base
  validates_presence_of :name, :email, :address
  has_many :line_items, :dependent => :destroy
  
  def add_line_items_from_cart(cart)
    cart.line_items.each do |li|
      li.cart_id = nil
      line_items << li
    end
  end
end
