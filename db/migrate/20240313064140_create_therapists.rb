class CreateTherapists < ActiveRecord::Migration[7.1]
  def change
    create_table :therapists do |t|
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
