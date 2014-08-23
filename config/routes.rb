Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'

  resources :groups do

    resources :users do

      resources :tools do

        resources :rentals

      end

    end

  end




  resources :categories, only: [:show]




end
