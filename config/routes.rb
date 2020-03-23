Rails.application.routes.draw do
  resources :teachers, only: [:create, :destroy]
  resources :students, only: [:show, :index]
end
