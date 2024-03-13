class CreateMoods < ActiveRecord::Migration[7.1]
  def change
    create_table :moods do |t|
      t.string :emotion
      t.date :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
