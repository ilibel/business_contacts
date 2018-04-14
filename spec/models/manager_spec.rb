require File.expand_path('../../spec_helper', __FILE__)

RSpec.describe Manager, type: :model do
  
  describe "creating a manager" do
    before(:each) do
      @organization = Organization.create(
        short_name: 'ООО "Ромашка"',
        full_name: 'Общество с ограниченной ответственностью "Ромашка"')
    end
    
    it "successfully create a manager" do
      manager = Manager.create(
        first_name: 'Иван',
        middle_name: 'Иванович',
        last_name: 'Иванов',
        email: 'admin@example.com',
        phone: '+1-202-250-3402',
        organization: @organization)
      expect(manager.valid?).to be_truthy
    end
    
    it "fail on validations with empty values" do
      manager = Manager.create
      expect(manager.valid?).to be_falsey
    end
    
    it "fail on validations with wrong values" do
      manager = Manager.create(
        first_name: ('A' * 256),
        middle_name: ('B' * 256),
        last_name: ('C' * 256),
        email: 'invalid_email',
        phone: 'invalid_phone',
        organization: nil)
      expect(manager.valid?).to be_falsey
    end
  end
  
end