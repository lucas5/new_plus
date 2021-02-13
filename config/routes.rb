Rails.application.routes.draw do

  namespace :home do
    get 'welcome/index'
  end

  namespace :users_backoffice do
    root to: "news#index"

    post 'accept_friend_request/:friend_id', to: 'friends#accept_friend_request', as: "accept_friend_request"
    post 'send_friend_request/:friend_id', to: 'friends#send_friend_request', as: "send_friend_request"

    delete 'undo_friendship/:friend_id', to: 'friends#undo_friendship', as: "undo_friendship"
    delete 'cancel_friend_request/:friend_id', to: 'friends#cancel_friend_request', as: "cancel_friend_request"

    resources :users
    resources :videos
    resources :news
  end

  namespace :admins_backoffice do
    root to: "admins#index"

    get 'welcome/index'
    get 'only_users', to: 'users#index_user'
    put 'ban_user/:id', to: 'users#ban_user'
    put 'remove_ban/:id', to: 'users#remove_ban', as: "remove_user_ban"

    get 'comments_by_user/:user_id', to: 'comments#comments_by_user', as: "get_comments"
    delete 'delete_comment/:id', to: 'comments#delete_comment', as: "delete_comment"

    resources :comments
    resources :users
    resources :tags
    resources :videos
    resources :news
  end

  devise_for :users, controllers: { sessions: 'users/sessions' }

  devise_scope :user do
    root to: "users/sessions#new"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
