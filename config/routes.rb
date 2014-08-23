Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'

  resources :groups do

    resources :users do

      resources :tools do

        get :transition

      end

    end

  end


  resources :rentals

  resources :categories, only: [:show]




end
