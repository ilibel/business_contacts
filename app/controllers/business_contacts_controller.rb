class BusinessContactsController < ApplicationController
  before_action :set_organization, except: [:index, :new, :create]

  # GET    /business_contacts
  def index
    @organizations = Organization.all
  end
  
  # GET    /business_contacts/new
  def new
    @organization = Organization.new
  end

  # GET    /business_contacts/:id/edit
  def edit
  end

  # GET    /business_contacts/:id
  def show
  end

  # POST   /business_contacts/
  def create
    @organization = Organization.new organization_params

    if @organization.save
      flash[:notice] = 'Organization successfully created!'
      redirect_to business_contacts_path
    else
      render :new
    end
  end

  # PUT    /business_contacts/:id
  def update
    if @organization.update organization_params
      flash[:notice] = 'Organization successfully updated!'
    end
    render :edit
  end

  # DELETE /business_contacts/:id
  def destroy
    @organization.destroy
    flash[:notice] = "Organization \"#{@organization.short_name}\" successfully deleted!"
    redirect_to business_contacts_path
  end
  
  private
  
  def set_organization
    @organization = Organization.find(params[:id])
  end
  
  def organization_params
    params.require(:organization).permit(
      :short_name,
      :full_name,
      :inn,                   
      :kpp,                   
      :ogrn,                  
      :bik,                   
      :bank_name,       
      :payment_account,
      :correspondent_account,
      :ceo_name,          
      :adress,              
      :phones,              
      :website,           
      :email)
  end

end
