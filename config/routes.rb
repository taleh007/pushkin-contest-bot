Rails.application.routes.draw do
  root 'quiz#index'
  resources :quiz, only: [:index]

  post 'quiz', to: 'quiz#task'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
