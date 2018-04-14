require File.expand_path('../../validators/email_validator', __FILE__)

class Organization < ActiveRecord::Base
  has_and_belongs_to_many :projects
  belongs_to :main_manager, class_name: "Manager"
  has_many   :managers, dependent: :destroy
  
  strip_attributes
  
  validates_uniqueness_of :short_name
  validates_presence_of   :short_name
  
  validates_uniqueness_of :full_name
  validates_presence_of   :full_name
  
  validates :inn,                   length:     { maximum: 255 }
  validates :kpp,                   length:     { maximum: 255 }
  validates :ogrn,                  length:     { maximum: 255 }
  validates :bik,                   length:     { maximum: 255 }
  validates :bank_name,             length:     { maximum: 255 }
  validates :payment_account,       length:     { maximum: 255 }
  validates :correspondent_account, length:     { maximum: 255 }
  validates :ceo_name,              length:     { maximum: 255 }
  validates :adress,                length:     { maximum: 255 }
  validates :phones,                length:     { maximum: 255 }
  validates :website,               length:     { maximum: 255 }
  validates :email,                 email: true,                  if: -> { email.present? }
  validates :email,                 length:     { maximum: 255 }, if: -> { email.present? }
  
  default_scope { includes(:main_manager) }
  
  def manager
    main_manager || managers.first
  end
end
