class User < ActiveRecord::Base
  ROLE_TYPES = ["Player", "Manager", "Admin", "Not known"]

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
    attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :status_id, :role_name
    
#  before_validation(:on => create) do 
#self.domain = Domain.find_or_create_domain_for(:domain => self.email.gsub(/.*@/,''))
#  end
  
  validates :first_name, :last_name, :presence => true
  validates :email, :uniqueness => true
  belongs_to :status
  has_many :tixes

 def fullname
        if first_name.blank?
        "Guest"
      else
   "#{first_name.titleize}" " " "#{last_name.titleize}"
          end
 end
  

def status_name
"#{status.status_name}"
end

def rolecap
"#{role_name.humanize}"
end

def travel
  travellers = User.count(:conditions => ['status_id = 1'])
  end
def dress
  dressers = User.count(:conditions => ['status_id = 2'])
  end
def bsquad 
  bsquadtotal = User.count(:conditions => ['status_id = 3'])
  end
def mngr
  managers = User.count(:conditions => ['status_id = 4'])
  end
def adminum
  adminum = User.count(:conditions => ['status_id = 5'])
  end
def notknown
  notknown = User.count(:conditions => ['status_id = 6'])
  end
end