class TextContentController < ApplicationController

  def new
  end

  def show
  end

  def create
    @new_text = TextContent.build(text_params)
    respond_to do |format|
      if @text.save
        format.html {render "user_sessions/show"}
        format.js
      else
        flash[:alert] = "Text not created successfully"
        format.html {render "user_sessions/show"}
      end
    end
  end

  def update
    @update_text = TextContent.find(params[:id])
    respond_to do |format|
      if @update_text.update_attributes(text_params)
        format.html {render "user_sessions/show"}
        format.js
      else
        flash[:alert] = "Text not updated successfully"
        format.html {render "user_sessions/show"}
      end
    end
  end

  private

    def text_params
      params.require(:text_content).permit(:text, :parent, :parent_class, :label, :id)
    end


end
