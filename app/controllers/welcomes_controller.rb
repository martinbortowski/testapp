class WelcomesController < ApplicationController
   
  def index
    #@instagram = Instagram.user_recent_media("259624044", {:count => 6})
  end
  
  def language
  end
   
  def download_pdf
    send_file("#{Rails.root}/public/pdf-sample.pdf", filename: "pdf-sample.pdf", type: "application/pdf")
  end 
  
  def download
    @resume = Resume.find(params[:id])
    send_file resume_file_location(@resume), type: "application/pdf", disposition: "attachment"
  end

  private
  
  def resume_file_location(resume)
    "#{Rails.root}/public#{resume.download_file}"
  end
    
end

