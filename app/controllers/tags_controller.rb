class TagsController < ApplicationController
skip_before_filter :verify_authenticity_token, :only => :create
  def show
    @tag = Tag.find(params[:id])
  end

  def create
    @tag = Tag.new(tag_params)
    respond_to do |format|
      if @tag.save
        format.js { render "create"}
      else
        format.html {render user_sessions_path}
      end
    end
  end

  def update
    @update_tag = Tag.find(params[:id])
    respond_to do |format|
      if @update_tag.update_attributes(tag_params)
        format.js {render "update"}
      else
        format.html {render user_sessions_path}
      end
    end
  end

  private
    def tag_params
      params.require(:tag).permit(:name, :content, :image)
    end
end
