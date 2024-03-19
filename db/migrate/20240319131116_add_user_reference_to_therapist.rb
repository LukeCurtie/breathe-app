class AddUserReferenceToTherapist < ActiveRecord::Migration[7.1]
  def change
    add_reference :therapists, :user, foreign_key: true
  end
end
