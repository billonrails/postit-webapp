PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  resources :post, except: [:destroy]
end
