class Checkin < ActiveRecord::Base
  validates :checked_in_on, :uniqueness => {:scope => :user_id}
  
  after_save :set_too_late
  
  def set_too_late
    if self.created_at >= self.created_at.to_date.midnight + 10.hours
      Checkin.update_all({:late => true})
    end
  end
end
