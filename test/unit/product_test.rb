require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  test "product attributes must not be empty" do
    prod = Product.new
    assert prod.invalid?
    assert prod.errors[:name].any?
    assert prod.errors[:description].any?
    assert prod.errors[:image].any?
    assert prod.errors[:price].any?
  end
  
  test "product price must be greater than 0.01" do
    product = Product.new(:name        => "My Book Title",
                          :description => "yyy",
                          :image       => "zzz.jpg")
    product.price = -1
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01",
                  product.errors[:price].join('; ')
    
    product.price = 0
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01",
                  product.errors[:price].join('; ')
    
    product.price = 1
    assert product.valid?
  end
  
  def new_product(image_url)
    Product.new :name => "new_product",
                :description => "new_product description.",
                :price => 22.22,
                :image => image_url
  end
  
  test "image url format" do
    good_imgs = %w{ rails.png rails.jpg rails.gif http://a.b.c/d/e/f.gif }
    bad_imgs = %w{ rails.doc rails.jpg/test rails.gif.bad }
    
    good_imgs.each do |img|
      assert new_product(img).valid?, "#{img} should be a valid file, but was invalid"
    end
    
    bad_imgs.each do |img|
      assert new_product(img).invalid?, "#{img} should be an invalid file, but was valid"
    end
  end
  
  test "product is not valid without a unique title" do
    product = Product.new(:name        => products(:one).name,
                          :description => "yyy",
                          :price       => 1,
                          :image       => "fred.gif")
    assert !product.save
    assert_equal "has already been taken", product.errors[:name].join('; '); 
  end

end
