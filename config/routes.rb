Rails.application.routes.draw do
  root 'actives#index', as: 'home'

  get 'about' => 'pages#about', as: 'about'
  get 'help' => 'pages#help', as: 'help'

  resources :actives
end
