Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :destroy, :show]
  resources :timetables, only: [:index, :destroy, :show]
  resources :classrooms, only: [:index, :destroy, :show]
end
