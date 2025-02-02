class CardBlueprint < Blueprinter::Base
  identifier :id

  fields :users_id, :card_type, :number, :balance
end
