class Organization < ActiveRecord::Base
  has_and_belongs_to_many :projects
  belongs_to :main_manager, class_name: "Manager"
  has_many   :managers, dependent: :destroy
  
  strip_attributes
  
  validates_uniqueness_of :short_name
  validates_presence_of   :short_name
  
  validates_uniqueness_of :full_name
  validates_presence_of   :full_name
  
  default_scope { includes(:main_manager) }
  
  def manager
    main_manager || managers.first
  end
end
