Rails.application.routes.draw do
  root to: 'pages#home'
  get 'playlist', to: 'pages#playlist'
end
