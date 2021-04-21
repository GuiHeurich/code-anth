# Configure your routes here
# See: https://guides.hanamirb.org/routing/overview
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
root to: 'home#index'
resources :readings, only: [:index]
resources :posts, only: [:index, :show]
post '/interlocutors', to: 'interlocutors#create', as: 'create_interlocutor'
get '/posts/:id', to: 'posts#show'
