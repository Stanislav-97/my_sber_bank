class Api::V1::Banks::Users::CardsController < ApplicationController
  def index
    render json: { data: CardBlueprint.render_as_hash(cards) }
  end

  private

  def cards
    @cards ||= current_user.cards
  end

  def card
    @card ||= cards.find(params[:card_id])
  end
end
