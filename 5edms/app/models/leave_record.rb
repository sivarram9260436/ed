class LeaveRecord < ActiveRecord::Base
  has_one :leave_type
  belongs_to :employee_detail
  belongs_to :personal_detail
  validates :from_date, :reason, :presence => { :message => "should not be blank" }
  validates :to_date, :presence => { :message => "should not be blank" }
  validate :leave_record_validation
  validate :total_days
  validate :already_applied
    
  def leave_record_validation
    if not self.from_date.blank? and not self.to_date.blank?    
      errors[:base] << ("To date should be greater than from date") if self.from_date > self.to_date
        if not self.no_of_days.blank?
          errors[:base] <<  ("No leaves available")if self.employee_detail.leave_details.where("year=? and leave_type_id=?",self.year,self.leave_type_id).first.balance < self.no_of_days           
        end      
      errors[:base] <<  ("fill no of days")if self.no_of_days.blank? or self.no_of_days==0
    end
  end
  
  def total_days
    if not self.no_of_days.blank?
      if self.leave_type_id != 5
        if  self.no_of_days.to_s.split(".").last !="0"
          errors[:base] << ("Half day leave is allowed only in Time Off")
        end
      end
    end
  end

  def already_applied
    all_dates = LeaveRecord.where(employee_detail_id:self.employee_detail_id).where("status !=?", 'cancelled').collect{|aa| [aa.from_date,aa.to_date]}.flatten.uniq
    if (all_dates.include? self.from_date) || (all_dates.include? self.to_date)
      errors[:base] << ("Leave already applied for this date")
    end
  end

end

 
    
