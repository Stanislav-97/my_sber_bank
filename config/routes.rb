Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      resources :banks, only: [] do
        resources :users, only: %i[index] do
          resources :cards, only: %i[index]
        end
      end
      resources :cards, only: [] do 
        post :withdrawal_from_my_card
        post :replenishment_my_card
        post :send_money_by_card
        post :send_money_by_phone
      end
    end
  end
end
