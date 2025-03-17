class Cards::Send < AppService
  option :card_from, Types::Instance(Card)
  option :card_to, Types::Instance(Card)
  option :amount, Types::Coercible::Float

  def call
    if card_from.balance >= amount
      perform_send
      true
    else
      false
    end
  rescue StandadError
    false
  end

  private

  def perform_send
    Card.transaction do
      Cards::Withdrawal.call(card: card_from, amount: amount)
      Cards::Replenishment.call(card: card_to, amount: amount)
    end
  end
end
