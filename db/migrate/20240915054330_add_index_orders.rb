class AddIndexOrders < ActiveRecord::Migration[7.0]
  def up
    unless index_exists?(:addresses, :order_id, name: "index_addresses_on_order_id_unique")
      add_index :addresses, :order_id, unique: true, name: "index_addresses_on_order_id_unique"
    end
  end

  def down
    if index_exists?(:addresses, :order_id, name: "index_addresses_on_order_id_unique")
      remove_index :addresses, name: "index_addresses_on_order_id_unique"
    end
  end
end
