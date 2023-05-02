Rails.application.routes.draw do
  root 'actives#index', as: 'home'

  get 'about' => 'pages#about', as: 'about'
  get 'help' => 'pages#help', as: 'help'
  get 'videos' => 'pages#videos', as: 'videos'
  get 'numerical_character' => 'pages#numerical_character', as: 'numerical'

  resources :actives
end
