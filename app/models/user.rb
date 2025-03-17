class User < ApplicationRecord
  belongs_to :bank
  has_many :cards

  validates :first_name, :last_name, :phone, presence: true
  validates :phone, uniqueness: { case_sensitive: false }
  validates :email, format: { with: /([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9_-]+)/ }, if: :email_present?

  def email_present?
    email.present?
  end
end
