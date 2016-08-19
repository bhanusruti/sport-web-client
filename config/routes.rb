Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get '/sports/new', to:'sports#new'

    get '/sports', to: 'sports#index'

    
    post '/sports', to: 'sports#create'
    
    get '/sports/:id/edit', to:'sports#edit'
    
    patch '/sports/:id', to:'sports#update'
    
    delete '/sports/:id', to:'sports#destroy'

    get '/sports/:id', to: 'sports#show'


end
