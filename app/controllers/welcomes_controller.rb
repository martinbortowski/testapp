class WelcomesController < ApplicationController
   
   def index
   end
   
   def language
   end
   
  def download_pdf
    send_file("#{Rails.root}/public/pdf-sample.pdf", filename: "pdf-sample.pdf", type: "application/pdf")
  end 
  
  def download
    send_data @resume, type: "application/pdf", disposition: "attachment"
  end
  
end

