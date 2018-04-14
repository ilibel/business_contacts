require File.expand_path('../../validators/email_validator', __FILE__)

class Manager < ActiveRecord::Base
  belongs_to :organization
  
  strip_attributes
  
  validates_presence_of :first_name
  validates :first_name,  length:     { maximum: 255 }
  
  validates :middle_name, length:     { maximum: 255 }
  
  validates_presence_of :last_name
  validates :last_name,   length:     { maximum: 255 }

  validates :email,       email: true  
  validates :email,       length:     { maximum: 255 }
  
  validates :phone,       length:     { maximum: 255 }
  
  validates_presence_of :organization
  validates_associated  :organization
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
