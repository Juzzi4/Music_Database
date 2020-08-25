Rails.application.routes.draw do
  resources :users do
    resources :musics
end
resources :users
resources :musics
resources :user_musics
post '/login', to: 'auth#create', as: 'login'
end
