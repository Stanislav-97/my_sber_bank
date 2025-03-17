class Api::V1::CardsController < ApplicationController
  def withdrawal_from_my_card
    if Cards::Withdrawal.call(card: card, amount: params[:amount])
      head :ok
    else
      render json: { error: "Не хватает средств" }, status: 422
    end
  end

  def replenishment_my_card
    Cards::Replenishment.call(card: card, amount: params[:amount])
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
    if Cards::Send.call(card_from: card, card_to: card_to, amount: params[:amount])
      head :ok
    else
      render json: { error: "Не хватает средств" }, status: 422
    end
  end

  def card
    @card ||= current_user.cards.find(params[:card_id])
  end
end
