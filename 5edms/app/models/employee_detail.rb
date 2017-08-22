
class EmployeeDetail < ActiveRecord::Base
has_one :personal_detail
has_one :role
belongs_to :office_type

#attr_accessible :title, :date_of_join, :emp_name,:empl_id,:middle_name,:pan_number,:last_name,:pf_number,:dob,:pf_uan_no,:gender,:official_mailid,:martial_status,:manager_mailid,:contact_no,:office_contact_no


accepts_nested_attributes_for :personal_detail

has_many :leave_records
has_many :leave_details

validates :emp_name, :presence => true
validates :dob, :presence => true

validates :contact_no, :presence => true, :numericality => true, :length => 6..32
validates :manager_mailid, :presence => true
validates :official_mailid, :presence => true, :uniqueness => true


scope :children, -> (email) {where("manager_mailid =? and active =?",email,"Active")}



#scope :by_active, where(:active => "Active")
scope :by_active, -> { where(:active=> "Active") }



 # scope :by_mailid, -> { (:order=> "official_mailid asc") }
# scope :by_mailid, order("official_mailid asc")


  scope :by_mailid,-> { order 'official_mailid asc' }


def deactivate
	self.active="Deactivated"
	self.save(:validate=>false)
end

def self.export_user_data
  CSV.open("#{Rails.root}/public/employee_data.csv", "w") do |csv|
      csv << ["MailID", "Employee ID","FirstName", "MiddleName", "LastName", "Gender","Date Of Join","Certificate DOB", "Actual DOB", "Martial Status", "Contact number", "Office Contact Number", "Pan Number", "PF Number","PF UAN Number", "TL MailID", "Manager MailID", "Father Name", "Mother Name", "Blood Group", "Personal Mail ID", "Anniversary Date", "Local Address", "Permanent Address", "Emergency Person", "Relationship", "Emergency Number", "Emergency Contact"]
      @users = EmployeeDetail.where("active = ?", "Active").order("official_mailid asc").each do |emp|
        csv << ["#{emp['official_mailid']}",
               "#{emp['empl_id']}",
               "#{emp['emp_name']}",
               "#{emp['middle_name']}",
               "#{emp['last_name']}",
               "#{emp['gender']}",
               "#{emp['date_of_join']}",
               "#{emp['dob']}",
               "#{emp.personal_detail.p_dob if emp.personal_detail}",
               "#{emp['martial_status']}",
               "#{emp['contact_no']}",
               "#{emp['office_contact_no']}",
               "#{emp['pan_number']}",
               "#{emp['pf_number']}",
	             "#{emp['pf_uan_no']}",
               "#{emp['manager_mailid']}",
               "#{emp['tl_mailid']}",
               "#{emp.personal_detail.father_name if emp.personal_detail}",
               "#{emp.personal_detail.mother_name if emp.personal_detail}",
               "#{emp.personal_detail.blood_group if emp.personal_detail}",
               "#{emp.personal_detail.personalmail_id if emp.personal_detail}",
               "#{emp.personal_detail.anniversary_date if emp.personal_detail}",
               "#{emp.personal_detail.local_address if emp.personal_detail}",
               "#{emp.personal_detail.permanent_address if emp.personal_detail}",
               "#{emp.personal_detail.guardian if emp.personal_detail}",
               "#{emp.personal_detail.relationship if emp.personal_detail}",
               "#{emp.personal_detail.emergency_contact if emp.personal_detail}"]
      end
   end
end

def self.export_individual_leave(emp_id)
  @leave_records = LeaveRecord.where("employee_detail_id = ? AND year = ? AND status != ?", emp_id, Time.now.year, "cancelled").order("from_date asc")
  CSV.open("#{Rails.root}/public/employee_leave_list.csv", "w") do |csv|
    csv << ["From Date", "To Date", "No Of Days", "Leave Type", "Status", "Reason"]
    @leave_records.each do |emp_leave|
      leave_type = LeaveType.find(emp_leave.leave_type_id).leave_types
      csv << [emp_leave.from_date,emp_leave.to_date,emp_leave.no_of_days,leave_type,emp_leave.status,emp_leave.reason]
    end
  end
end

end
