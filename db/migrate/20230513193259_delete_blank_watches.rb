class DeleteBlankWatches < ActiveRecord::Migration[7.0]
  def up
    Watch.where(brand: nil, model: nil, price: nil).delete_all
  end

  def down
    # This migration cannot be undone
  end
end
