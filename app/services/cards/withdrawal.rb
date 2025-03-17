class Cards::Withdrawal < AppService
  option :card, Types::Instance(Card)
  option :amount, Types::Coercible::Float

  def call
    if card.balance >= amount
      card.balance -= amount
      card.save
    else
      false
    end
  end
end
