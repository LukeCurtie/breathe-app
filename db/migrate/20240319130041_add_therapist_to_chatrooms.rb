class AddTherapistToChatrooms < ActiveRecord::Migration[7.1]
  def change
    add_reference :chatrooms, :therapist, foreign_key: true
  end
end
