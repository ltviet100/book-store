class AddExtraFieldToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :format, :string
    add_column :books, :excerpt, :text
    add_column :books, :page, :string
    add_column :books, :price, :decimal
    add_column :books, :buy_link, :string
  end
end
