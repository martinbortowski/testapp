class ResumesController < ApplicationController
  around_filter :catch_not_found
  before_action :find_resume, only: [ :show, :edit, :update, :destroy, :download ]
  before_action :authenticate_user!
  
  def show
  end
  
  def new
    if @resume = current_user.resume
      redirect_to @resume
    else
      @resume = Resume.new
    end
  end

  def create
    @resume = current_user.build_resume(resume_params)
    if @resume.save
      redirect_to @resume
    else
      render :new
    end
  end
  
  def edit
  end
        
  def update
    if @resume.update resume_params
      redirect_to @resume, notice: "Your resume was successfully saved!"
    else
      render 'edit'
    end
  end
  
  def destroy
    @resume.destroy
    redirect_to new_resume_path, notice: "Your resume was successfully deleted!"
  end
  
  def download
    send_data @resume, type: "application/pdf", disposition: "attachment"
  end
  
  private
  
  def resume_params
    params.require(:resume).permit( :user_id, :download_file, :remove_download_file)
  end
  
  def find_resume
    @resume = Resume.find(params[:id])
  end
  
  def catch_not_found
    yield
    rescue ActiveRecord::RecordNotFound
    redirect_to(root_url, :notice => 'Record not found')
  end
  
end
