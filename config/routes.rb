Rails.application.routes.draw do
  resources :tr_contact_history do
    collection do
      get 'csv'
    end
  end
  get '/csv' => 'csv#create'
  get 'tr_contact_history/main'
  get 'top' => 'root#root'
  get '/main', to: 'tr_contact_history#main'
  get 'tr_contact_history/csv'
  post 'tr_contact_history' => 'tr_contact_history#create'
end
