class Cards::Replenishment < AppService
  option :card, Types::Instance(Card)
  option :amount, Types::Coercible::Float

  def call
    card.balance += amount
    card.save
  end
end
