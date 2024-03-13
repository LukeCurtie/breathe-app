class Mood < ApplicationRecord
  belongs_to :user
  validates :date, uniqueness: {scope: :user}
end
