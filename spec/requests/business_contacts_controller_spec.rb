require File.expand_path('../../spec_helper', __FILE__)

RSpec.describe BusinessContactsController, type: :request do
  
  describe "GET	/business-contacts" do
    before { get '/business-contacts' }
    
    it "returns list of business contacts" do
      expect(response).to render_template(:index)
      expect(response).to have_http_status(200)
    end
  end
  
end