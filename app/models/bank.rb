class Bank < ApplicationRecord
  has_many :cards, through: :users
  has_many :users

  validates :name, presence: true
end
