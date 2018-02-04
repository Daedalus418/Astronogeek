Rails.application.routes.draw do

  root 'ideas#index'

  resources :ideas, except: :index do
    resources :comments, only: [:create, :edit, :update, :destroy]
    post :upvote, on: :member
  end

  get '/newest' => 'ideas#newest'

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :users, only: [:new, :create]

end
