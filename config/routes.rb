Rails.application.routes.draw do
  root to: "cocktails#index"
  resources :cocktails, :only => [:new, :create, :index, :edit, :show] do
    resources :doses, only: [ :new, :create]
  end
  resources :doses, only: [ :destroy]
end
