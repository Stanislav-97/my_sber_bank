class Api::V1::Banks::Users::CardsController < ApplicationController
  def index
    render json: { data: CardBlueprint.render_as_hash(cards) }
  end

  # создать контроллерр cards
  # перенести в новый контроллер cards
  def send_money
    if card.balance >= params[:amount]
      Card.transaction do
        withdrawal
        replenishment
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

  def withdrawal
    card.balance -= params[:amount]
    card.save
  end

  def replenishment
    card_to = Card.find_by(number: params[:card_number])
    card_to.balance += params[:amount]
    card_to.save
  end
end
