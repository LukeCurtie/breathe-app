class AddCoordinatesToTherapists < ActiveRecord::Migration[7.1]
  def change
    add_column :therapists, :latitude, :float
    add_column :therapists, :longitude, :float
  end
end
