class UserBlueprint < Blueprinter::Base
  identifier :id

  fields :first_name, :last_name, :email, :phone

  association :cards, blueprint: CardBlueprint, default: []
end
