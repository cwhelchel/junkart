class AddCatIdToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :category_id, :integer, :null => true
  end

  def self.down
    remove_column :products, :category_id
  end
end
