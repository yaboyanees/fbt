class Status < ActiveRecord::Base

  attr_accessible :name
  validates :name, :presence => true
  
  has_many :users


def status_name
"#{name.humanize}"
end





end
