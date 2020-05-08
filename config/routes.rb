Rails.application.routes.draw do
  get 'tr_contact_history/main'
  get 'top' => 'root#root'
  root to: "tr_contact_history#main"
  get '/main', to: 'tr_contact_history#main'
  post 'tr_contact_history' => 'tr_contact_history#create'
end
