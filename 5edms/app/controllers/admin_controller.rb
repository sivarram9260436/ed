class AdminController < ApplicationController
    require 'securerandom'
    require 'digest/md5'
    before_filter :authorization, :only=>["new_user","create"]
    layout "welcomelayout",:except=>["forgot_password","password_filling_form"] 
  def index
  end

  def new_user
    @employee_detail = EmployeeDetail.new()
    render :layout => 'welcomelayout'
  end

  def create  
    if not params[:employee_detail][:official_mailid].blank? 
      @employee_detail = EmployeeDetail.new(params[:employee_detail])
      email  = EmployeeDetail.find_by_official_mailid(params[:employee_detail][:official_mailid])     
      random_string = ActiveSupport::SecureRandom.hex(4)      
     
    if not email.blank? 
       flash[:notice]="USERNAME ALREADY PRESENT" 
       render :new_user
    else
        hash_pass = Digest::MD5.hexdigest(random_string)
        @employee_detail.password=hash_pass

        if @employee_detail.save(:validate => false)
           leave_types=LeaveType.all
           for leave_type in leave_types
            
           LeaveDetail.create(:employee_detail_id=>@employee_detail.id,:leave_type_id=>leave_type.id,:total_leaves=>leave_type.total_leaves,:balance=>leave_type.total_leaves,:availed=>0,:carry_forward=>0,:year=>"#{Time.now.year}",:total_leave_balance=>leave_type.total_leaves)
        end
            if params[:employee_detail][:title]=="Mr"
          
            leave_type_id=LeaveType.where("leave_types =?","Maternity").first.id
            
            @leave_detail=LeaveDetail.where("employee_detail_id =? and leave_type_id =?",@employee_detail.id,leave_type_id).first
         else
            leave_type_id=LeaveType.where("leave_types =?","Paternity").first.id
            @leave_detail=LeaveDetail.where("employee_detail_id =? and leave_type_id =?",@employee_detail.id,leave_type_id).first
         end
            @leave_detail.total_leave_balance=0
            @leave_detail.balance=0
            @leave_detail.save 
            
            LoginMailer.login_email(@employee_detail,random_string,request.host).deliver
            redirect_to :action => "show"
       
        else
           render :new_user,:layout => 'welcomelayout'
        end
        end
      else
        @employee_detail = EmployeeDetail.new()
        flash[:notice]="Please enter username and password"
        render :new_user,:layout => 'welcomelayout'

    end 
        
  end
  def update_user     
      @employee_detail = EmployeeDetail.find(params[:official_mailid]) 
      render :layout => 'welcomelayout'      
   end

  def new_role    
      @employee_detail=EmployeeDetail.find_by_official_mailid(params[:employee_detail][:official_mailid])
      @employee_detail.role_id=params[:employee_detail][:role_id]
      @employee_detail.save(:validate=>false)
      redirect_to :controller=>"select",:action => "view_employee_leave"
  end
  
  def forgot_password  
  if render :template =>"admin/forgot_password",:layout=>"forgot_password"
  else
    redirect_to :controller=>"employee",:action => "login"
  end
  end

  def password_filling_form 
    authent=EmployeeDetail.find_by_official_mailid(params[:employee_detail][:official_mailid])
     if authent.present?     
       @employee_detail=authent     
       @employee_detail.reset_password_code =  ActiveSupport::SecureRandom.hex(4)
       @employee_detail.active_resetcode='true'
       @employee_detail.save(:validate=>false)
      code =@employee_detail.reset_password_code      
      LoginMailer.reset_password_mail(@employee_detail,code,"edms.kreatio.com/employee/fill_own_password").deliver
      render :template =>"admin/password_filling_form",:layout=>"forgot_password"
  else
    flash[:notice]="Enter valid MailId"
    render :forgot_password, :layout => 'forgot_password'

  end
end

  def show
  render :layout => 'welcomelayout'
  end


end
