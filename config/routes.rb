Rails.application.routes.draw do
  post '/roll', to: 'games#roll'
end
