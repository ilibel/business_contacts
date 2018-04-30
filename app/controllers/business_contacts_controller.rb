class BusinessContactsController < ApplicationController
  before_action :authorize_global, except: [:index, :show]
  before_action :set_organization, except: [:index, :new, :create]
  before_action :set_projects, except: [:index, :show, :destroy]

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
      flash[:notice] = l('notice_business_contact.organization_successful_create')
      redirect_to business_contacts_path
    else
      render :new
    end
  end

  # PUT    /business_contacts/:id
  def update
    params[:organization][:project_ids] ||=[]
    if @organization.update organization_params
      flash[:notice] = l('notice_business_contact.organization_successful_update')
    end
    render :edit
  end

  # DELETE /business_contacts/:id
  def destroy
    @organization.destroy
    flash[:notice] = l('notice_business_contact.organization_successful_delete', organization_short_name: @organization.short_name)
    redirect_to business_contacts_path
  end
  
  # POST	/business_contacts/:business_contact_id/manager
  def create_manager
    if @organization.managers.create
      flash[:notice] = l('notice_business_contact.manager_successful_create')
    end
    redirect_to edit_business_contact_path @organization
  end
  
  # DELETE	/business_contacts/:business_contact_id/manager/:manager_id
  def destroy_manager
    @manager = @organization.managers.find(params[:manager_id])
    if @manager.destroy
      flash[:notice] = l('notice_business_contact.manager_successful_delete')
    end
    redirect_to edit_business_contact_path @organization
  end
  
  private
  
  def set_organization
    @organization = Organization.find(params[:business_contact_id] || params[:id])
  end
  
  def set_projects
    @projects = Project.all
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
      :email,
      :main_manager_id,
      managers_attributes: [:id, :first_name, :middle_name, :last_name, :email, :phone, :birthday, :organization_id],
      project_ids: [])
  end

end
