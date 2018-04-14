class BusinessContactsController < ApplicationController

  # GET	/business-contacts
  def index
    @organizations = Organization.all
  end

end
