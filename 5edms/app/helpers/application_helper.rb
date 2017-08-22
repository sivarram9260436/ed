module ApplicationHelper
  def error_messages(object, message=nil) 
    html = "" 
    unless object.errors.blank? 
      html << "<div class='errorExplanation' id = 'errorExplanation'>\n" 
      if message.blank? 
        if object.new_record? 
          html << "\t\t<h2>#{object.errors.count} errors prevented this #{object.class.name.humanize.downcase} from being saved </h2>\n" 
        else 
          html << "\t\t<h2>#{object.errors.count} errors prevented this #{object.class.name.humanize.downcase} from being saved</h2>\n" 
        end 
      else 
        html << "<h5>#{message}</h5>" 
      end 
      html << "\t\t<ul>\n" 
      object.errors.full_messages.each do |error| 
        html << "\t\t\t<li>#{error}</li>\n" 
      end 
      html << "\t\t</ul>\n" 
      html << "\t</div>\n" 
    end 
    html 
  end

  def testing
    content_tag :p, nil,  class: "text-center" do
      content_tag :a, href: "/admin/forgot_password" do
        +"Forgot password?"
      end
    end
  end
  #
  def forgot
    content_tag :p, nil,  class: "text-center" do
      content_tag :a,  href:"/employee/log" do
        +"Back to login ?"
      end
    end
  end


#   def modifyprofile
#       content_tag :span,nil, class:"fa-stack fa-lg pull-left" do
#         content_tag :i,   class:"fa  fa-user-plus fa-stack-1x " do
#           content_tag :a,  href:"/employee/create" do
#             +"modifyprofile"
#           end
#
#
#       end
#
# end
#
#   end
  end
# <p class="text-center"><a href="forgot.html"><i class="fa fa-lock"></i> Forgot password?</a></p>
#
#
# <p class="text-center"><a href="login.html"><i class="fa fa-sign-in"></i> Back To login?</a></p>




# <li><a href="modifyProfile.html"><span class="fa-stack fa-lg pull-left"><i class="fa  fa-user-plus fa-stack-1x "></i></span>modify</a></li>
# <li><a href="view_profile.html"><span class="fa-stack fa-lg pull-left"><i class="fa  fa-eye fa-stack-1x "></i></span>view Profile</a></li>
# <li><a href="all_profile.html"><span class="fa-stack fa-lg pull-left"><i class="fa  fa-group fa-stack-1x "></i></span>view others profile</a></li>
