# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks'
  }

  root to: 'tweets#index'

  resources :tweets

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
