class Tix < ActiveRecord::Base

  attr_accessible :guest_f_name, :guest_l_name, :user_id, :user_borrow_id, :pool_id
  belongs_to :pool
  belongs_to :user
  belongs_to :borrower, :class_name => "User", :foreign_key => "user_borrow_id"

  def gamename
    "#{pool.gamename}"
  end

  def fullname
      if user.first_name.blank?
        "Guest"
      else
        "#{user.first_name} " " #{user.last_name}"
      end

  end
  def guestname
    "#{guest_f_name} " " #{guest_l_name}"
end

def tixtotal
@totals = Tix.count_all_by_user_borrow_id(current_user)
end

end