Rails.application.routes.draw do
  devise_for :users
  resources :recipe_foods
  get 'recipes/:id/new', to: 'recipe_foods#new'
  resources :foods
  resources :recipes
  resources :users
  resources :public_recipes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "recipes#index"
end
