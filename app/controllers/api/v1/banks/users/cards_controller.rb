class Api::V1::Banks::Users::CardsController < ApplicationController
  def index
    render json: { data: CardBlueprint.render_as_hash(cards) }
  end
#создать контроллерр cards
  def send_money #перенести в новый контроллер cards
    if card.balance >= params[:amount]
      Card.transaction do 
        card.balance -= params[:amount]
        card.save

        card_to = Card.find_by(number: params[:card_number])
        card_to.balance += params[:amount]
        card_to.save
      end

      head :ok
    else
      render json: { error: "Не хватает средств" }, status: 422
    end
  end

  private

  def cards
    @cards ||= current_user.cards
  end

  def card
    @card ||= cards.find(params[:card_id])
  end
end
