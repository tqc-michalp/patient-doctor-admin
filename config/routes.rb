# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'messages#index'

  resources :messages
  resources :payments, only: %i[create]
end
