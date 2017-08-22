class PersonalDetail < ActiveRecord::Base
	belongs_to :employee_detail

	#attr_accessor :father_name, :mother_name, :anniversary_date, :local_address, :permanent_address, :changeof_address, :personalmail_id, :guardian, :relationship, :emergency_contact, :blood_group, :passport_numberm, :linkedin_url, :facebook_url, :twitter_url, :company_name, :company_name2, :designation, :designation2, :experience, :experience2, :pg, :pg_year, :ug, :ug_year, :diploma, :diploma_year, :puc, :puc_year, :tenth, :tenth_year

	validates :father_name,:presence => true
	validates :mother_name,:presence => true 
	validates :personalmail_id, :presence => true, :uniqueness => true
	validates :local_address, :presence => true
	validates :permanent_address, :presence => true
	validates :emergency_contact, :presence => true, :numericality => true, :length => 5..32
	validates :blood_group,:presence => true


	#scope :by_bday_month,where('extract(day  from p_dob) = ? AND extract(month  from p_dob) = ?', (Date.today+3.days).day,Date.today.month)
	scope :by_bday_today_month, ->{where('extract(day  from p_dob) = ? AND extract(month  from p_dob) = ?', Date.today.day,Date.today.month)}
	scope :by_bday_tomorrow_month,->{ where('extract(day  from p_dob) = ? AND extract(month  from p_dob) = ?', Date.today.day+1,Date.today.month)}
	scope :by_bday_yesterday_month,->{ where('extract(day  from p_dob) = ? AND extract(month  from p_dob) = ?', Date.today.day-1,Date.today.month)}

	scope :by_anniversary_today_day_month,->{ where('extract(day  from anniversary_date) = ? AND extract(month  from anniversary_date) = ?', Date.today.day,Date.today.month)}
	scope :by_anniversary_tommorow_day_month,-> { where('extract(day  from anniversary_date) = ? AND extract(month  from anniversary_date) = ?', Date.today.day+1,Date.today.month)}
	scope :by_anniversary_yesterday_day_month,-> { where('extract(day  from anniversary_date) = ? AND extract(month  from anniversary_date) = ?', Date.today.day-1,Date.today.month)}
end
