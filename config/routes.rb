Rails.application.routes.draw do
  root to: 'home#top'
  devise_for :users
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :index, :edit, :update]
  get 'home/about' => 'home#about'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
