ActionMailer::Base.delivery_method = :sendmail
ActionMailer::Base.sendmail_settings = {
  :address              => "127.0.0.1",
  :port                 => 25,
  :domain               => "edms",
###  :user_name            => "edms@kreatio.com",  
###  :password             => "Kreatio2016",  
###  :authentication       => "login",  
###  :enable_starttls_auto => true
  

}

