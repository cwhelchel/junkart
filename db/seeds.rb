# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Product.delete_all
Category.delete_all

Product.create(:name => 'Swirl Art #19',
               :description => "Number 19 of the Swirl Art collection.",
               :image => "swirlart19.jpg",
               :price => 85.00
               )


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
               :price => 85.00
               )

Category.create(
                :name => 'Junk Art',
                :description => 'The default category all all of the art',
                :image => 'rails.png'
                )

Category.create(
                :name => 'Swirl Art',
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
                :image => 'rails.png'
                )
