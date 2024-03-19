Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :journal_entries
  resources :moods, only: [:index, :new, :create]
  resources :therapists, only: [:index,] do
    resources :chatrooms, only: [:show] do
      resources :messages, only: [:create]
    end

  end





  get "aichat" => "pages#aichat"
  get "chat_responses" => 'chat_responses#stream'


  get "spotify" => 'spotify#display'
  get '/spotify', to: 'spotify#search'


  resources :quotes, only: [:index]

end
