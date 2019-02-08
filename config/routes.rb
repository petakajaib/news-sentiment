Rails.application.routes.draw do
  resources :entity_sources
  resources :entity_sentences
  resources :sentences
  resources :sentiments
  resources :sources
  resources :entities

  root to: 'sentiments#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
