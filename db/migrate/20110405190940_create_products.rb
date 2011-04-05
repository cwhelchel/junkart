class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.column :name,        :string, :null => false
      t.column :description, :string, :null => false
      t.column :price,       :decimal, :precision => 8, :scale => 2
      t.column :quantity,    :integer
      t.column :image,       :string
      t.column :thumbnail,   :string
      t.timestamps
    end
    
    # here is where we'd have to do a raw SQL statement to alter the table
    # to create foreign key constraints.
    
    # ex: execute "alter table line_items add constraint fk_line_item_products
    #                    foreign key (product_id) references products(id)"
  end

  def self.down
    drop_table :products
  end
end
