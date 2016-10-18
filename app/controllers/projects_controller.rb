class ProjectsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create
  def index
    if params[:tag]
      @projects = Project.tagged_with(params[:tag])
    else
      @projects = Project.all
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save!
        format.js { render "create"}

      else
        format.html {render user_sessions_path}
      end
    end
  end

  def update
    @update_project = Project.find(params[:id])
    respond_to do |format|
      if @update_project.update_attributes(project_params)
        format.js {redirect_to user_sessions_path}
      else
        format.html {redirect_to user_sessions_path}
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.delete
    respond_to do |format|
      format.js {render "update"}
      format.html {render "index"}
    end

  end

  private
    def project_params
      params.require(:project).permit(:name, :content, :all_tags, :image, :github, :site)
    end
end
