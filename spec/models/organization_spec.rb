require File.expand_path('../../spec_helper', __FILE__)

RSpec.describe Organization, type: :model do
  
  describe "creating an organization" do
    it "successfully create an organization" do
      organization = Organization.create(
        short_name: 'ООО "Ромашка"',
        full_name: 'Общество с ограниченной ответственностью "Ромашка"')
      expect(organization.valid?).to be_truthy
    end
    
    it "fail on validations" do
      organization = Organization.create
      expect(organization.valid?).to be_falsey
    end
  end
  
end