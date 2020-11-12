Rails.application.routes.draw do
  root 'homes#index' #この一行を修正する
  resources :jobs, only: [:index, :new, :create, :show] #この一行を追加

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
