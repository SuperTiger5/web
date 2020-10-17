Rails.application.routes.draw do
  get 'places/index'

  root 'static_pages#top'
  get '/signup', to: 'users#new'
  
  get    '/login', to: 'sessions#new'      #ログインページへ
  post   '/login', to: 'sessions#create'   #ログイン(セッション作成)
  delete '/logout', to: 'sessions#destroy' #ログアウト(セッション削除)
  
  get 'working_user', to: 'users#working_user'
  get 'working_user_osaka', to: 'users#working_user_osaka'
  get 'working_user_tokyo', to: 'users#working_user_tokyo'
  get 'working_user_nagoya', to: 'users#working_user_nagoya'
  
  get 'osaka', to: 'users#index_osaka'
  get 'tokyo', to: 'users#index_tokyo'
  get 'nagoya', to: 'users#index_nagoya'
  
  get 'request/users', to: 'attendances#request_users'
  
  resources :users do
    member do
      get 'edit_basic_info'
      patch 'update_basic_info'
      get 'attendances/edit_one_month'
      patch 'attendances/update_one_month'
    end
    resources :attendances, only: :update do
      member do
        patch 'update_request'
        patch 'update_approval'
      end
    end
  end
  
  
end
