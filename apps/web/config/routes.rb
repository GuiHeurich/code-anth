# Configure your routes here
# See: https://guides.hanamirb.org/routing/overview
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
get '/', to: 'home#index'
post '/interlocutors', to: 'interlocutors#create', as: :create_interlocutor
get '/readings', to: 'readings#index', as: :readings
get '/posts', to: 'posts#index', as: :posts
