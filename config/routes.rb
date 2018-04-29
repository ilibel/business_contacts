resources :business_contacts do
    post   'manager'             => 'business_contacts#create_manager',  as: :managers
    delete 'manager/:manager_id' => 'business_contacts#destroy_manager', as: :manager
end
