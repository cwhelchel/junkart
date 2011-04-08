class Product < ActiveRecord::Base
  validates :name, :description, :presence => true
  validates :name, :uniqueness => true
  
  validates :price, :numericality => { :greater_than_or_equal_to => 0.01 }
  validates :image, :format => {
    :with    => %r{\.(gif|jpg|png)$}i, # ends w/ proper extension
    :message => 'image must be a URL for a GIF, JPG, or PNG image.'
  }
end
