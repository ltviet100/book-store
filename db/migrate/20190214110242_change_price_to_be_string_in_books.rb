class ChangePriceToBeStringInBooks < ActiveRecord::Migration[5.2]
  def change
    change_column :books, :price, :string
  end
end
