class AddWatchOwnerIdToRentals < ActiveRecord::Migration[6.0]
  def change
    add_column :rentals, :watch_owner_id, :integer
  end
end
