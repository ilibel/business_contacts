require File.expand_path('../../validators/email_validator', __FILE__)

class Manager < ActiveRecord::Base
  belongs_to :organization
  
  strip_attributes
  after_destroy { organization.update_columns(main_manager_id: nil) if organization.main_manager_id == self.id }
  
  validates_presence_of :first_name,                    on: :update
  validates :first_name,  length:     { maximum: 255 }
  
  validates :middle_name, length:     { maximum: 255 }
  
  validates_presence_of :last_name,                     on: :update
  validates :last_name,   length:     { maximum: 255 }

  validates :email,       email: true,                  on: :update
  validates :email,       length:     { maximum: 255 }, on: :update
  
  validates :phone,       length:     { maximum: 255 }
  
  validates_presence_of :organization
  validates_associated  :organization
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
