Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ja/ do
  root 'pictures#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:create, :destroy, :index]
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  resources :pictures do
    collection do
     post :confirm
    end
  end
end
