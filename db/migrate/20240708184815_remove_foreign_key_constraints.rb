class RemoveForeignKeyConstraints < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key "line_item_dates", "quotes"
    remove_foreign_key "line_items", "line_item_dates"
    remove_foreign_key "quotes", "companies"
    remove_foreign_key "users", "companies"
  end
end
