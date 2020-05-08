Rails.application.routes.draw do
  get 'tr_contact_history/main'
  get 'top' => 'root#root'
  get '/main', to: 'tr_contact_history#main'
  post 'tr_contact_history' => 'tr_contact_history#create'
end
