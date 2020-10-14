class ResumesController < ApplicationController
  def index
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)

    if @resume.save
      redirect_to root_path, notice: "Resume has been uploaded"
    else
      render 'new'
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to root_path, notice: "resume has been destroyed"
  end

  private
  def resume_params
    params.require(:resume).permit(:name, :attachment)
  end
end
