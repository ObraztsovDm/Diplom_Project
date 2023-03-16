Rails.application.routes.draw do
  root 'actives#index', as: 'home'

  get 'about' => 'pages#about', as: 'about'
  get 'help' => 'pages#help', as: 'help'
  get 'videos' => 'pages#videos', as: 'videos'

  resources :actives
end
