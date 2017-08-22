class LeaveMailer < ActionMailer::Base

 def apply_email(leave)
   @leave_record =leave
   @sender =@leave_record.employee_detail.official_mailid
   @to=@leave_record.employee_detail.manager_mailid
   @tl=@leave_record.employee_detail.tl_mailid
   @off = @leave_record.employee_detail.office_type.name    
   mail(:from=>@sender,:to =>@to,:cc =>[@tl,@sender,"hr@kreatio.com"].compact,:subject => "Request for a leave") if @off == "Kreatio"
   mail(:from=>@sender,:to =>@to,:cc =>[@tl,@sender,"hr@webnish.com"].compact,:subject => "Request for a leave") if @off == "Webnish"
  end

 def test_email
   mail(:from =>"kreatio_email.kreatio.com",:to =>"vaidheeswaran@kreatio.com",:subject => "Request for a leave")
 end
  
  end

