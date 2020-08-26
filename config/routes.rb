# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  namespace :api do
    scope module: :jobs do
      scope :jobs do
        resources :searches
      end
    end
    resources :jobs
  end
end