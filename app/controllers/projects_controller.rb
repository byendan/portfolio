class ProjectsController < ApplicationController
  def index
    @projects = Project.all
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

  private
    def project_params
      params.require(:project).permit(:name, :content, :all_tags)
    end
end
