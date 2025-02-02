class Card < ApplicationRecord
  CARD_TYPES = %w[
    debit
    credit
  ].freeze

  enum card_type: CARD_TYPES.zip(CARD_TYPES).to_h

  belongs_to :user

  validates :balance, :number, :card_type, presence: true
  validates :number, uniqueness: { case_sensitive: false }

  delegate :bank, to: :user
end
