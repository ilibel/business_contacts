Redmine::Plugin.register :business_contacts do
  name 'Business Contacts plugin'
  author 'Ilya Belyakov'
  description 'This is a plugin for Redmine which adds a business contacts functionality'
  version '0.0.1'
  url 'https://github.com/ilyabelyakov/business_contacts'
  author_url 'https://github.com/ilyabelyakov'

  permission :create_business_contacts, :business_contacts => [:new, :create, :create_manager]
  permission :edit_business_contacts,   :business_contacts => [:edit, :update]
  permission :remove_business_contacts, :business_contacts => [:destroy, :destroy_manager]
  menu :application_menu, :business_contacts, { :controller => 'business_contacts', :action => 'index' }, :caption => :label_business_contact_plural
end
