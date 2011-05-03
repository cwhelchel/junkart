# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Product.delete_all
Category.delete_all
User.delete_all

rootUser = User.new()
rootUser.name = 'root'
rootUser.password = 'root'
rootUser.save


# this is the default category
Category.create(
                :name => 'Junk Art',
                :description => 'The default category all all of the art',
                :image => 'rails.png'
                )

Category.create(
                :name => 'Swirl Art',
                :description => %{
                This art is very swirlly.
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
                veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex
                ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
                velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
                cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id
                est laborum.
                },
                :image => 'rails.png'
                )

default_cat = Category.find_by_name('Junk Art')
swirl_cat = Category.find_by_name('Swirl Art')
puts "junk art id : #{default_cat.id}"
puts "swirl art id: #{swirl_cat.id}"

Product.create(:name => 'Swirl Art #01',
               :description => 'First in the swirl art collection',
               :image => 'swirlart19.jpg',
               :price => 250.99,
               :category_id => swirl_cat.id
               )

for i in (5..19)
  Product.create(:name => "Swirl Art #%02d" % i,
                 :description => "Number #{i} of the Swirl Art collection.",
                 :price => rand(200),
                 :category_id => swirl_cat.id,
                 :image => "swirlart%02d.jpg" % i)
end

Product.create(:name => 'Blue and Purple Flower (Large)',
               :description => %{
               A wonderful blue and purple flower. It's quite large.
               Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
               tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
               veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex
               ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
               velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
               cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id
               est laborum.
               },
               :image => "lgblueandpurpleflower50.jpg",
               :price => 55.85,
               :category_id => default_cat.id
               )


