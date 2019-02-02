Rails.application.routes.draw do
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users, except: [:new, :create]
  resources :tips 
  resources :lesson_topics, only:[:index, :show] do 
    resources :tips, only: [:index, :new]
  end 
  

end
