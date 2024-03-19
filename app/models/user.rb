class User < ApplicationRecord
  has_many :journal_entries
  has_many :moods
  has_many :messages
  has_many :chatrooms
  has_many :therapists

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
