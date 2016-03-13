class ProjectsController < ApplicationController
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
      if @project.save
        format.js
      else
        format.html {render user_sessions_path}
      end
    end
  end

  def update
    @update_project = Project.find(params[:id])
    respond_to do |format|
      if @update_project.update_attributes(project_params)
        format.js
      else
        format.html {render user_sessions_path}
      end
    end
  end

  private
    def project_params
      params.require(:project).permit(:name, :content, :all_tags)
    end
end
