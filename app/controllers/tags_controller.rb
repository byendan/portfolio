class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
  end

  def create
    @tag = Tag.new(tag_params)
    respond_to do |format|
      if @tag.save
        format.js
      else
        format.html {render user_sessions_path}
      end
    end
  end

  def update
    @update_tag = Tag.find(params[:id])
    respond_to do |format|
      if @update_tag.update_attributes(tag_params)
        format.js
      else
        format.html {render user_sessions_path}
      end
    end
  end

  private
    def tag_params
      params.require(:tag).permit(:name, :content)
    end
end
