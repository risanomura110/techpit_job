Rails.application.routes.draw do
  devise_for :users

  root 'homes#index' #この一行を修正する
  resources :jobs, only: [:index, :new, :create, :show]do
  resources :entries
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
