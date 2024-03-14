class CreateQuotes < ActiveRecord::Migration[7.1]
  def change
    create_table :quotes do |t|
      t.string :content
      t.date :publish_date

      t.timestamps
    end
  end
end
