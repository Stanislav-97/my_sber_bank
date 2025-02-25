class Api::V1::CardsController < ApplicationController
  def withdrawal_from_my_card
    if card.balance >= params[:amount]
      withdrawal

      head :ok
    else
      render json: { error: "Не хватает средств" }, status: 422
    end
  end

  def replenishment_my_card
    replenishment(card)

    head :ok
  end

  def send_money_by_card
    card_to = Card.find_by(number: params[:card_number])

    send_money(card_to)
  end

  def send_money_by_phone
    user = User.find_by(phone: params[:user_phone])
    card_to = user.cards.first # TODO: add default card of sbp

    send_money(card_to)
  end

  private

  def send_money(card_to)
    if card.balance >= params[:amount]
      Card.transaction do
        withdrawal
        replenishment(card_to)
      end

      head :ok
    else
      render json: { error: "Не хватает средств" }, status: 422
    end
  end

  def withdrawal
    card.balance -= params[:amount]
    card.save
  end

  def replenishment(card_to)
    card_to.balance += params[:amount]
    card_to.save
  end

  def card
    @card ||= current_user.cards.find(params[:card_id])
  end
end
