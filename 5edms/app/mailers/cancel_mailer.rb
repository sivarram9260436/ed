class CancelMailer < ActionMailer::Base
 def cancel_email(cancelled)
    @leave_record=cancelled    
    @sender=@leave_record.employee_detail.manager_mailid
    @to=@leave_record.employee_detail.official_mailid
    @tl=@leave_record.employee_detail.tl_mailid
    @off=@leave_record.employee_detail.office_type.name
    mail(:from=>@sender,:to=>@to,:cc=>[@tl,@sender,"hr@kreatio.com"].compact,:subject=>"Leave cancelled") if @off == "Kreatio"
    mail(:from=>@sender,:to=>@to,:cc=>[@tl,@sender,"hr@webnish.com"].compact,:subject=>"Leave cancelled") if @off == "Webnish"
 end
 def cancel_email_own(cancelled)
    @leave_record=cancelled
    @sender=@leave_record.employee_detail.official_mailid
    @to=@leave_record.employee_detail.manager_mailid
    @tl=@leave_record.employee_detail.tl_mailid
    @off=@leave_record.employee_detail.office_type.name
    mail(:from=>@sender,:to=>@to,:cc=>[@tl,@sender,"hr@kreatio.com"].compact,:subject=>"Leave cancelled") if @off == "Kreatio"
    mail(:from=>@sender,:to=>@to,:cc=>[@tl,@sender,"hr@webnish.com"].compact,:subject=>"Leave cancelled") if @off == "Webnish"
 end

 def hr_cancel(cancelled)
    @leave_record=cancelled
    @to=@leave_record.employee_detail.official_mailid
    @off=@leave_record.employee_detail.office_type.name
    @tl=@leave_record.employee_detail.tl_mailid
    @manager=@leave_record.employee_detail.manager_mailid
    mail(:from=>"hr@kreatio.com",:to=>@to,:cc=>[@tl,@manager,"hr@kreatio.com"].compact, :subject=>"Leave cancelled") if @off == "Kreatio"
    mail(:from=>"hr@webnish.com",:to=>@to,:cc=>[@tl,@manager,"hr@webnish.com"].compact, :subject=>"Leave cancelled") if @off == "Webnish" 
 end

end
