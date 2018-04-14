Redmine::Plugin.register :business_contacts do
  name 'Business Contacts plugin'
  author 'Ilya Belyakov'
  description 'This is a plugin for Redmine which adds a business contacts functionality'
  version '0.0.1'
  url 'https://github.com/ilyabelyakov/business_contacts'
  author_url 'https://github.com/ilyabelyakov'
  
  menu :application_menu, :business_contacts, { :controller => 'business_contacts', :action => 'index' }, :caption => 'Business Contacts'
  # TODO: Add permissions
end
