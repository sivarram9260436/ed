class SelectController < ApplicationController
   require 'date'   
   'HOLIDAYS'

   before_filter :admin
   before_filter :authorization,:only=>["edit_leave","update_leave","leave_generate","leave_creation"]
    layout "welcomelayout" 
   
  
    def apply
       @leave_record=LeaveRecord.new()
       end
  
    def list
   	if request.xhr?
        employee_detail_id=session[:emp_id]
        @leave_record = LeaveRecord.where("employee_detail_id =? AND year =? AND status=?", session[:emp_id], params[:year], params[:status]).order("from_date asc")
        render :partial => "select/list", :layout => false
       else
        employee_detail_id=session[:emp_id]
        @leave_record = LeaveRecord.where("employee_detail_id =? AND year =?", session[:emp_id], Time.now.year).order("from_date asc")
       end    
   end
       
   def create
    
    if params[:employee_detail][:id].to_i==session[:emp_id]
        @employ=EmployeeDetail.find(session[:emp_id])
        if not @employ.manager_mailid.blank?            
          # @leave_detail=LeaveDetail.find_by_employee_detail_id_and_leave_type_id_and_year(session[:emp_id],params[:leave_record][:leave_type_id],params[:leave_record][:from_date].to_i) 
          # if @leave_detail.balance >= params[:leave_record][:no_of_days].to_f and not params[:leave_record][:no_of_days].to_f==0
           
            if params[:leave_record][:from_date].to_i == params[:leave_record][:to_date].to_i 
              @leave_record= LeaveRecord.new(params[:leave_record]) 
              @leave_record.employee_detail_id=session[:emp_id] 
              @leave_record.year=params[:leave_record][:from_date].to_i 
	      if params[:leave_record][:leave_type_id] == "8"
if !(params[:leave_record][:no_of_days].to_f > 1)               
 if FESTIVAL.include? params[:leave_record][:from_date]                  
                  @leave_record.save
                  @leave_detail=LeaveDetail.find_by_employee_detail_id_and_leave_type_id_and_year(params[:employee_detail][:id],params[:leave_record][:leave_type_id],params[:leave_record][:from_date].to_i)
                   @leave_detail.balance=@leave_detail.balance-params[:leave_record][:no_of_days].to_f
                   @leave_detail.availed=@leave_detail.availed+params[:leave_record][:no_of_days].to_f
                   @leave_detail.save
                  LeaveMailer.apply_email(@leave_record).deliver
                  flash[:notice]='Optional Leave applied successfully'
                  redirect_to :controller =>'select',:action => 'list'
                else
                  flash[:notice]='This is not an optional leave'
                  render :controller => 'select',:action => 'apply'
                end
                else
                  flash[:notice]='Please apply optional leave individually for each day'
                  render :controller => 'select',:action => 'apply'

                end
              else
              	if @leave_record.save            
                 	LeaveMailer.apply_email(@leave_record).deliver
                 	flash[:notice]='Leave applied successfully' 

                         #this code will deduct employee leaves on the time of apply itself
                   @leave_detail=LeaveDetail.find_by_employee_detail_id_and_leave_type_id_and_year(params[:employee_detail][:id],params[:leave_record][:leave_type_id],params[:leave_record][:from_date].to_i)
                   @leave_detail.balance=@leave_detail.balance-params[:leave_record][:no_of_days].to_f
                   @leave_detail.availed=@leave_detail.availed+params[:leave_record][:no_of_days].to_f
                   @leave_detail.save
                         
                 	redirect_to :controller =>'select',:action => 'list'
              	else
                	render :controller => 'select',:action => 'apply'
                end
	      end  
            else 
             flash[:notice]='Please apply individual leave for Next year'
             redirect_to :back
	    end 
                     
          # else
          #   @leave_record= LeaveRecord.new(params[:leave_record])
          #   flash[:notice]='No Leaves Available'
          #   render :controller => 'select',:action => 'apply'
          # end
        else
          @leave_record= LeaveRecord.new(params[:leave_record])
          flash[:notice]='Please fill your TL mailid in employee profile'
          render :back
        end
      else
        render :text=>"Its wrong url",:layout=>true
      end
    end 

      def business_days_calculation             
       date1=params[:start].to_date
       date2=params[:end].to_date   
       business_days = 0
       date = date2       
       while date>=date1      
        business_days = business_days + 1 unless date.strftime("%A") =="Sunday" or date.strftime("%A") =="Saturday" or HOLIDAYS.include?date.to_s
        date = date - 1.day
       end    
       @days=business_days
       render :partial =>"business_days_calculation"
      end 

 


    def list_all 
           admin_employee=EmployeeDetail.find(session[:emp_id]).official_mailid
        childs=EmployeeDetail.children(admin_employee)
        employees=[]
        if not childs.blank?
              childs.each do |manager|                  
               # if manager.role_id==1
               #  second_child=EmployeeDetail.children(manager.official_mailid)
               #  childs=childs+second_child
               #   end
               end               
               employees=childs 
        
            if not employees.blank?
              @leave_record=[]
               employees.each do |employee|                           
               # @leave_record << employee.leave_records.where("status !=? and year=?","cancelled",Date.today.year)
		end
               @leave_record=@leave_record.flatten
            else
               render :text =>'No employees under your control',:layout=>true
            end 
        else
          render :text =>'No employees under your control',:layout=>true
        end
      
    end    
        
 def unapproved_leave
        #byebug
        admin_employee=EmployeeDetail.find(session[:emp_id]).official_mailid
        childs=EmployeeDetail.children(admin_employee)
        employees=[]
        #byebug
        if not childs.blank?

              childs.each do |manager|
               if manager.role_id==1
                second_child=EmployeeDetail.children(manager.official_mailid)
                childs=childs+second_child
                 end
              end


               employees=childs

            if not employees.blank?
              @leave_record=[]
               employees.each do |employee|
               @leave_record << employee.leave_records.where("status =? and year=?","Pending",Date.today.year)

               end
               @leave_record=@leave_record.flatten
            else
               render :text =>'No employees under your control',:layout=>true
            end
        else
          render :text =>'No employees under your control',:layout=>true
   end

 end


    def approve      
      @leave_record =LeaveRecord.find(params[:leave_record_id])
        @leave_record.status="approved"
        @leave_record.save(:validate=>false)
          if params[:flag]=="hr_app"
            ApprovedMailer.hr_approved_email(@leave_record).deliver
            redirect_to :controller =>'select', :action =>'hr_approve'
          elsif params[:flag]=="old_leave"
            ApprovedMailer.approved_email(@leave_record).deliver
            redirect_to :controller =>'select', :action =>'unapproved_leave'
          else
            redirect_to :controller =>'select', :action =>'list_all'
          end
     end 
    
       
    def leave_balance     
       @leave_detail= LeaveDetail.where("employee_detail_id =? AND year =? ", session[:emp_id],Time.now.year)
       end
         
    def view_approved      
      @leave_record= LeaveRecord.where("employee_detail_id =? AND status =? AND year=?", session[:emp_id] ,"approved", Time.now.year).order("from_date asc")   
    end
      
    def cancel_leave           
      @leave_record= LeaveRecord.find(params[:id])
       @emp_id = params[:employee_detail_id].to_i
       @employee = EmployeeDetail.find (params[:employee_detail_id].to_i)
       @manager = EmployeeDetail.find session[:emp_id] if @emp_id != session[:emp_id]
       if @emp_id == session[:emp_id]
         if (params[:no_of_days].to_f == @leave_record.no_of_days) && (params[:leave_type_id].to_i == @leave_record.leave_type_id) && (params[:year].to_i == @leave_record.year)
           @leave_record.status='cancelled'
           @leave_record.save(:validate=>false)
           @leave_detail=LeaveDetail.find_by_employee_detail_id_and_leave_type_id_and_year(params[:employee_detail_id],params[:leave_type_id],params[:year])
           @leave_detail.balance=@leave_detail.balance+params[:no_of_days].to_f
           @leave_detail.availed=@leave_detail.availed-params[:no_of_days].to_f
           @leave_detail.save
           if @leave_detail.save
               CancelMailer.cancel_email_own(@leave_record).deliver
           end
         else
           render :text=>"Please cancel again!",:layout=>true
         end
       elsif (@manager.official_mailid == @employee.manager_mailid) || session[:role] == "HR"
         if (params[:no_of_days].to_f == @leave_record.no_of_days) && (params[:leave_type_id].to_i == @leave_record.leave_type_id) && (params[:year].to_i == @leave_record.year)
           @leave_record.status='cancelled'
           @leave_record.save(:validate=>false)
           @leave_detail=LeaveDetail.find_by_employee_detail_id_and_leave_type_id_and_year(params[:employee_detail_id],params[:leave_type_id],params[:year])
           @leave_detail.balance=@leave_detail.balance+params[:no_of_days].to_f
           @leave_detail.availed=@leave_detail.availed-params[:no_of_days].to_f
           @leave_detail.save
           if @leave_detail.save
             if session[:role] == "HR"
              CancelMailer.hr_cancel(@leave_record).deliver
             else
               CancelMailer.cancel_email(@leave_record).deliver
             end
           end
         else
           render :text=>"Please cancel again!",:layout=>true
         end
       else
          render :text =>'You have no rights to view this page',:layout=>true

       end
       redirect_to :back
    end
       
    def cancel
       logger.info"===============#{session[:emp_id].inspect}====================="
       #@leave_record= LeaveRecord.where("employee_detail_id =? AND status !=? AND from_date >=?", session[:emp_id] ,"cancelled",Date.today)
       @leave_record= LeaveRecord.where("employee_detail_id =? AND status =?",session[:emp_id] ,"Pending")
    end
   
    def select_year 
    end

    def documents
    end
    
   def download_form
     # if params[:year]=='2014'
     #    send_file "public/documents/List_of_holidays_2014_new ai2_2.pdf"
     # els
     #       if params[:year]=='2015'
     #  send_file "public/documents/List_Of_Holidays_2015.pdf"
     # els
     if params[:year]=='2016'
       send_file "public/documents/leave List 2016_new.pdf"
     elsif params[:leave_policy] == 'leave'
       send_file "public/documents/leave_policy1.pdf"
     elsif params[:performance_policy] == 'performance'
     send_file "public/documents/PR01_Performance_appraisal form.pdf"
      elsif params[:insurance_neft] == 'insurance_neft'
     send_file "public/documents/NEFT FORMAT.pdf"
     elsif params[:medical_insurance] == 'medical_insurance'
     send_file "public/documents/ReimbursementForm-bajaj-1.pdf"
     else
       send_file "public/documents/reimbursement.pdf"
     end
   end
    
    def select_employee
      team_employee=EmployeeDetail.find(session[:emp_id]).official_mailid
      childs=EmployeeDetail.children(team_employee)
       #employees=[]
        if not childs.blank?
             childs.each do |manager|
             if manager.role_id==1
               second_child=EmployeeDetail.children(manager.official_mailid)
                childs=childs+second_child
               end
              end
               employees=childs
               @employee_list=employees
           else
               render :text =>'You have no rights to view this page',:layout=>true
                      
         end
     end
    

    def employee_leave_balance
     team_employee=EmployeeDetail.find(session[:emp_id]).official_mailid
     childs=EmployeeDetail.children(team_employee)
     employees=[]
        if not childs.blank?
              childs.each do |manager|                  
               if manager.role_id==1
                 second_child=EmployeeDetail.children(manager.official_mailid)
                 childs=childs+second_child
                 end
               end               
               employees=childs               
               id=employees.collect{|aa| aa.id}
               emp_id=params[:employee_detail_id].to_i
              if id.include?emp_id
                @name=EmployeeDetail.where("id =?",params[:employee_detail_id])
                @employee_lists=LeaveDetail.where("employee_detail_id =? and year=?", params[:employee_detail_id],"#{Time.now.year}")
              else
                 render :text =>'You have no rights to view this page',:layout=>true
              end
             else
               render :text =>'You have no rights to view this page',:layout=>true
             end 
       @employee_lists=@employee_lists.flatten         
   end
  

    def edit_leave          
      @leav=LeaveDetail.where("employee_detail_id=? and year=?",params[:id],"#{Time.now.year}")
      @mailid=EmployeeDetail.where("id=?",params[:id])
    end  

    def update_leave  
       
      if not params[:email].blank?
        emp_id=EmployeeDetail.find_by_official_mailid(params[:email]).id
        until params[:leave].blank?
          a=params[:leave].first
          leave_detail=LeaveDetail.where("employee_detail_id =? and leave_type_id =? and year=?",emp_id,a.first.to_f,"#{Time.now.year}").first
          leave_detail.total_leave_balance=a[1].to_f
          leave_detail.balance=a[1].to_f
          leave_detail.save
          params[:leave].delete(a.first)         
        end
        redirect_to :action=>"view_employee_leave"      
      end  
    end

    def leave_generate
    end

    def leave_creation
      leave_types=LeaveType.all
      employees=EmployeeDetail.all 
      employees.each do |employee|
        for leave_type in leave_types
          LeaveDetail.create(:employee_detail_id=>employee.id,:leave_type_id=>leave_type.id,:total_leaves=>leave_type.total_leaves,:balance=>leave_type.total_leaves,:total_leave_balance=>leave_type.total_leaves,:availed=>0,:carry_forward=>0,:year=>params[:date][:year])
        end
      end
      alter_leave_female
      alter_leave_male
      redirect_to :action=>"leave_generate"  
    end


  def alter_leave_male
    EmployeeDetail.where(gender: "Male").each do |leav_det|
      emp = leav_det.leave_details.where(leave_type_id: 6, year: params[:date][:year]).first
      emp.total_leave_balance = 0
      emp.balance = 0
      emp.save
      puts leav_det.official_mailid
    end
  end

  def alter_leave_female
    EmployeeDetail.where(gender: "Female").each do |leav_det|
      emp = leav_det.leave_details.where(leave_type_id: 7, year: params[:date][:year]).first
      emp.total_leave_balance = 0
      emp.balance = 0
      emp.save
      puts leav_det.official_mailid
    end
  end

    def view_employee_leave   
      @employee_list=EmployeeDetail.where("active =?","Active").order("emp_name asc")      
      @available_leave=LeaveDetail.all  
    end

    def employee_new_leave_balance      
       @employee_lists=LeaveDetail.where("employee_detail_id =? and year=?", params[:employee_detail_id],"#{Time.now.year}")
       @emailid=EmployeeDetail.where("id=?",params[:employee_detail_id])
    end

    def hr_approve            
	#@leave_record =LeaveRecord.where("status =? AND from_date < ? AND year > ?","Pending",Date.today,"#{Time.now.year}")    
       # @leave_record =LeaveRecord.where("status =? AND from_date > ? ","Pending","2014-12-15")
   @leave_record= LeaveRecord.where("status =? AND from_date > ? ","Pending","2014-12-15").joins(:employee_detail).where("employee_details.active = ?", "Active")
end
    
    def hr_approve_view
        #@leave_record =LeaveRecord.where("status =? and year >?","approved","#{Time.now.year}")
        @leave_record =LeaveRecord.where("status =? and from_date >?", "approved", "2014-12-15")
	render :template => "/select/hr_approve"
    end

    def detect_unapplied_leaves
     @leave_record = LeaveRecord.new()
   end

   def detect_leaves
     emp_id = params[:leave_record][:employee_detail_id]
     leave_type =  params[:leave_record][:leave_type_id]
     from_date = params[:leave_record][:from_date]
     to_date = params[:leave_record][:to_date]
     no_of_days = params[:leave_record][:no_of_days]
     reason = params[:leave_record][:reason]
     if !emp_id.blank? && !leave_type.blank? && !from_date.blank? && !to_date.blank? && !no_of_days.blank? && (from_date <= to_date) && !reason.blank?
       year = params[:leave_record][:from_date].to_date.year
       days = params[:leave_record][:no_of_days].to_f
       @emp = EmployeeDetail.find (emp_id)
       leave_detail = @emp.leave_details.by_balance(leave_type,emp_id).first
       available = leave_detail.balance
       if available >= days
        @leave_record= LeaveRecord.create(leave_type_id: leave_type, no_of_days: days, employee_detail_id: emp_id, year: year, from_date: from_date, to_date: to_date, reason: reason, status: "approved")
        leave_detail.update_attributes(:balance=>leave_detail.balance-days, :availed=>leave_detail.availed+days)
        ApprovedMailer.deduct_mail(@leave_record).deliver
        flash[:notice]='Leave Deducted successfully'
        redirect_to "/select/employee_new_leave_balance?employee_detail_id=#{emp_id}&detected=true"
       else
         flash[:notice] = "Please select different leave type"
         render 'detect_unapplied_leaves'
       end
     else
       flash[:notice] = "Please fill all the fields"
       render 'detect_unapplied_leaves'
     end
   end
end

