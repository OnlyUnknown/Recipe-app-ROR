Rails.application.routes.draw do
  devise_for :users
  resources :recipe_foods
  get 'recipes/:id/new', to: 'recipe_foods#new'
  get 'general_shopping_list', to: 'shopping_list#index'
  get 'recipes/:id/toggled', to: 'recipes#toggle'
  resources :foods
  resources :recipes
  resources :users
  resources :public_recipes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "public_recipes#index"
end
