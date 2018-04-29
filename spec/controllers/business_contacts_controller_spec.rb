require File.expand_path('../../spec_helper', __FILE__)

RSpec.describe BusinessContactsController, type: :controller do
  
  describe "GET	/business_contacts" do
    before { get :index }
    
    it "returns list of business contacts" do
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET	/business_contacts/new" do
    before { get :new }
    
    it "returns page to create new business contact" do
      expect(response).to render_template(:new)
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET	/business_contacts/:id" do
    render_views
    # To create models in tests is better to use FactoryBot (aka FactoryGirl)
    before { @organization = Organization.create(short_name: 'Organization_name', full_name: 'Full_organization_name') }
    before { get :show, id: @organization.id }
    
    it "returns page with all fields of business contact" do
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:success)
      expect( Nokogiri(response.body).text ).to match Regexp.new(".*Short name:.*#{@organization. short_name}.*")
    end
  end
  
  describe "POST	/business_contacts" do
    
    it "creates new business contact" do
      organization_attributes = Organization.new(short_name: '1', full_name: '1').attributes
      expect {
        post :create, organization: organization_attributes
      }.to change{ Organization.count }.by(1)
      expect(response).to have_http_status(:redirect)
    end
  end
  
  describe "PATCH	/business_contacts/:id" do
    # To create models in tests is better to use FactoryBot (aka FactoryGirl)
    before { @organization = Organization.create(short_name: 'Organization_name', full_name: 'Full_organization_name') }
    let(:new_short_name) { 'New_organization_name' }
    
    it "updates an existing business contact" do
      patch :update, id: @organization.id, organization: {short_name: new_short_name}
      expect(response).to have_http_status(:success)
      @organization.reload
      expect(@organization.short_name).to be == new_short_name
    end
  end
  
  describe "DELETE	/business_contacts/:id" do
    before { @organization = Organization.create(short_name: '1', full_name: '1') }
    
    it "deletes a business contact" do
      expect {
        post :destroy, id: @organization.id
      }.to change{ Organization.count }.by(-1)
      expect(response).to have_http_status(:redirect)
    end
  end
  
  describe "POST	/business_contacts/:business_contact_id/manager" do
    before { @organization = Organization.create(short_name: '1', full_name: '1') }
    
    it "adds a business contact manager" do
      expect {
        post :create_manager, business_contact_id: @organization.id
      }.to change{ Manager.count }.by(1)
      expect(response).to have_http_status(:redirect)
    end
  end
  
  describe "DELETE	/business_contacts/:business_contact_id/manager/:manager_id" do
    before { @organization = Organization.create(short_name: '1', full_name: '1') }
    before { @manager = @organization.managers.create }
    
    it "deletes a business contact manager" do
      expect {
        post :destroy_manager, business_contact_id: @organization.id, manager_id: @manager.id
      }.to change{ Manager.count }.by(-1)
      expect(response).to have_http_status(:redirect)
    end
  end
  
end