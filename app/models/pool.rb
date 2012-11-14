class Pool < ActiveRecord::Base
  has_many :tixes, :dependent => :destroy
  belongs_to :domain
  validates :game, :amount, :travelling, :dressing, :b_squad, :manager, :presence => true
  validates :amount, :travelling, :dressing, :b_squad, :manager, :numericality => true

  def gamename
    "#{game.upcase}"
  end
  
  def total  
    number = 0
    travellingtotal = User.count(:conditions => ['status_id = 1'])
    number = travellingtotal * travelling
    dressingtotal = User.count(:all, :conditions => ['status_id = 2'])
    number = number + dressingtotal * dressing
    bsquadtotal = User.count(:all, :conditions => ['status_id = 3'])
    number = number + bsquadtotal * b_squad
    managertotal = User.count(:all, :conditions => ['status_id = 4'])
    number = number + managertotal * manager
    return number 
  end
  
  def totalamount
    total
  end
  
    def amountallocated
    amount
  end

  def canmaketickets?
		    #This definition will verify the number of tickets in amount will work based on number of players, and add them.

   if total > amount
	errors.add(:base, "Your Math is off! Try again Jack Wagon!")
	errors.add(:base, "You were allowed: " "#{amountallocated}" " but you tried to issue: " "#{totalamount}" " tickets out")
      false

    else
      true
    end
  end

  def maketickets

      @users = User.find(:all)
      for user in @users
        if user.status.name == "b_squad"
          for z in 1..self.b_squad
            @tix = self.tixes.new(:user_id => user.id, :user_borrow_id => user.id)
            @tix.save
          end
        elsif user.status.name == "travelling"
          for z in 1..self.travelling
            @tix = self.tixes.new(:user_id => user.id, :user_borrow_id => user.id)
            @tix.save
          end
        elsif user.status.name == "manager"
          for z in 1..self.manager
            @tix = self.tixes.new(:user_id => user.id, :user_borrow_id => user.id)
            @tix.save
          end
        elsif user.status.name == "dressing"
          for z in 1..self.dressing
            @tix = self.tixes.new(:user_id => user.id, :user_borrow_id => user.id)
            @tix.save
          end

        end
      end
#Add the rest of the tickets to admin.
	u = User.find_by_role_name("Admin")
       leftover = amount-total
          for z in 1..leftover
            @tix = self.tixes.new(:user_id => u.id, :user_borrow_id => u.id, :pool_id => self.id)
            @tix.save
       end
       self.admin = leftover
       self.save


    end



end
