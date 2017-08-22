class ApprovedMailer < ActionMailer::Base
  def approved_email(approved)
    @leave_record=approved    
    @sender =@leave_record.employee_detail.manager_mailid
    @to =@leave_record.employee_detail.official_mailid
    @tl =@leave_record.employee_detail.tl_mailid
    @off =@leave_record.employee_detail.office_type.name 	
    mail(:from=>@sender,:to=>@to,:cc=>[@tl,@sender,"hr@kreatio.com"].compact,:subject=>"Leave Approved") if @off == "Kreatio"
    mail(:from=>@sender,:to=>@to,:cc=>[@tl,@sender,"hr@webnish.com"].compact,:subject=>"Leave Approved") if @off == "Webnish"
  end
  def hr_approved_email(approved)
    @leave_record=approved    
    @sender=@leave_record.employee_detail.manager_mailid
    @to=@leave_record.employee_detail.official_mailid
    @tl=@leave_record.employee_detail.tl_mailid
    @off = @leave_record.employee_detail.office_type.name
    mail(:from=>"hr@kreatio.com",:to=>@to,:cc=>[@sender,@tl,"hr@kreatio.com"].compact,:subject=>"Leave Approved") if @off == "Kreatio"
    mail(:from=>"hr@webnish.com",:to=>@to,:cc=>[@sender,@tl,"hr@webnish.com"].compact,:subject=>"Leave Approved") if @off == "Webnish"
  end
  def deduct_mail(deducted)
    @leave_record = deducted
    @to=@leave_record.employee_detail.official_mailid
    @tl=@leave_record.employee_detail.tl_mailid
    @manager=@leave_record.employee_detail.manager_mailid
    @off = @leave_record.employee_detail.office_type.name
    mail(:from=>"hr@kreatio.com", :to=>@to, :cc=>[@manager,@tl,"hr@kreatio.com"].compact, :subject=> "Leave Deducted") if @off == "Kreatio"
    mail(:from=>"hr@webnish.com", :to=>@to, :cc=>[@manager,@tl,"hr@webnish.com"].compact, :subject=> "Leave Deducted") if @off == "Webnish"
  end
  def added_leaves(emp,days)
    @emp = emp
    @days = days
    @to = @emp.official_mailid
    @tl=@emp.tl_mailid
    @manager=@emp.manager_mailid
    mail(:from=>"hr@kreatio.com", :to=>@to, :cc=>[@manager,@tl,"hr@kreatio.com"].compact, :subject=> "Comp Off Added")
  end
end
