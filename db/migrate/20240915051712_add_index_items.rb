class AddIndexItems < ActiveRecord::Migration[7.0]
  def up
    unless index_exists?(:orders, :item_id, name: "index_orders_on_item_id_unique")
      add_index :orders, :item_id, unique: true, name: "index_orders_on_item_id_unique"
    end
  end

  def down
    if index_exists?(:orders, :item_id, name: "index_orders_on_item_id_unique")
      remove_index :orders, name: "index_orders_on_item_id_unique"
    end
  end
end
