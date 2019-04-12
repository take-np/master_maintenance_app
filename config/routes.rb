Rails.application.routes.draw do
  get '/', to: 'masters#top'

  get 'masters/index', to: 'masters#index'
  
  get 'masters/search', to: 'masters#search'

  post 'masters/register_csv', to: 'masters#register_csv'
  get 'masters/new', to: 'masters#new'

  get 'masters/detail/:id', to: 'masters#detail'
  get 'masters/edit', to: 'masters#edit'

  get 'masters/approval_change', to: 'masters#approval_change'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end





