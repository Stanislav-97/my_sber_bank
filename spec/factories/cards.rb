FactoryBot.define do
  factory :card do
    user

    balance { Faker::Number.between(from: 100, to: 1000) }
    number { Faker::Finance.credit_card(:mastercard) }
    card_type { "debit" }

    Card.card_types.each_key do |card_type|
      trait card_type do
        card_type { card_type }
      end
    end
  end
end
