class Product < ActiveRecord::Base
  belongs_to :category
  
  validates :name, :description, :presence => true
  validates :name, :uniqueness => true
  
  validates :price, :numericality => { :greater_than_or_equal_to => 0.01 }
  validates :image, :format => {
    :with    => %r{\.(gif|jpg|png)$}i, # ends w/ proper extension
    :message => 'image must be a URL for a GIF, JPG, or PNG image.'
  }
  
  def new()
    if self.category_id.nil?
      # uncategorized or "default" category
      cat = Category.find_by_name('Junk Art')
      # this works but it needs to into an init method or something
      self.category_id = cat.id
    end
  end
  
  def get_category_name()
    cat_id = self.category_id
    
    if cat_id.nil?
      # uncategorized or "default" category
      cat = Category.find_by_name('Junk Art')
      # this works but it needs to into an init method or something
      self.category_id = cat.id 
      self.save
    else
      cat = Category.find(cat_id)
    end
    cat.name
  end
end
