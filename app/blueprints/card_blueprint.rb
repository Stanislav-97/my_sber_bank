class CardBlueprint < Blueprinter::Base
  identifier :id

  fields :user_id, :card_type, :number, :balance
end
