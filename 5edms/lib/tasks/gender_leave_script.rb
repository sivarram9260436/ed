class GenderLeaveScript
	def self.alter_leave_male
		EmployeeDetail.where(gender:"Male").each do |leav_det|
			emp = leav_det.leave_details.where(leave_type_id:6, year:2015).first
			emp.total_leave_balance = 0
			emp.balance = 0
			emp.save
			puts leav_det.official_mailid
		end
	end

	def self.alter_leave_female
		EmployeeDetail.where(gender:"Female").each do |leav_det|
			emp = leav_det.leave_details.where(leave_type_id:7, year:2015).first
			emp.total_leave_balance = 0
			emp.balance = 0
			emp.save
			puts leav_det.official_mailid
		end
	end
end
