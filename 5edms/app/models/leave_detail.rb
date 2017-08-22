class LeaveDetail < ActiveRecord::Base
  belongs_to :employee_detail
 # belongs_to :leave_record
  has_many :leave_types
  #scope :by_current_year, {:conditions => ["year = ?", Date.today.year] }
  scope :by_leave_type, lambda{|leave_id| {:conditions => ["leave_type_id = ?", leave_id] }}
  scope :by_employee, lambda{|emp| {:conditions => ["employee_detail_id = ?", emp]}}
  scope :by_balance, lambda{|leave_id,emp| {:conditions => ["leave_type_id = ? AND employee_detail_id = ? And year = ?", leave_id,emp,Date.today.year]}}
end
