class UserFormsController < ApplicationController

  def addP
    respond_to do |format|
      format.js
    end
  end

  def addT
    respond_to do |format|
      format.js
    end
  end

  def editP
    @projects = Project.all
    respond_to do |format|
      format.js
    end
  end

  def editT
    @tags = Tag.all
    respond_to do |format|
      format.js
    end
  end

  def loadP
    @project_load = Project.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def loadT
    @tag_load = Tag.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

end
