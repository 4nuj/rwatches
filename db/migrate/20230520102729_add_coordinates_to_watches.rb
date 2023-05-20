class AddCoordinatesToWatches < ActiveRecord::Migration[7.0]
  def change
    add_column :watches, :latitude, :float
    add_column :watches, :longitude, :float
  end
end
