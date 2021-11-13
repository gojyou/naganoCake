class RemovePostCodeFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :post_code, :string
  end
end
