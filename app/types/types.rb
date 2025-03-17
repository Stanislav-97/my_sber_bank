module Types
  include Dry.Types()

  IntegerOrString = Types::Integer | Types::String

  # class ReplenishmenParams < Dry::Struct
  #   attribute :card_id, Types::Integer
  #   attribute :amount, Types::Coercible::Float

  #   def card
  #     Card.find(card_id)
  #   rescue ActiveRecord::RecordNotFound
  #     nil
  #   end
  # end
end
