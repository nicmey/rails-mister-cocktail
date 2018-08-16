Rails.application.routes.draw do
  resources :cocktails, :only => [:new, :create, :index, :edit, :show] do
    resources :doses, only: [ :new, :create]
  end
  resources :doses, only: [ :destroy]
end
