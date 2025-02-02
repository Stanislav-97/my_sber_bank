Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      resources :banks, only: [] do
        resources :users, only: %i[index] do
          resources :cards, only: %i[index] do
            post "send_money", to: "cards#send_money" #надо будет убрать
          end
        end
      end
      resources :cards
    end
  end
end
