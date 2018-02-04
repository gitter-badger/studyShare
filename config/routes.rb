Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#index"
  resources "curriculums", only: [:index, :new]
  get "lesson", to: "lessons#index"
end
