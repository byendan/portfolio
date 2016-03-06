class BubblesController < ApplicationController
  def new
  end

  def show
  end

  def update
    @bub = Bubble.find(params[:bubble_id])
    @bub_num = params[:bubble_id]

    respond_to do |format|
      if @bub.update_attributes(bubble_params)
        @bubbles = Bubble.all

        format.html {render "user_sessions/show" }
        format.js 

      else
        @bubbles = Bubble.all
        format.html {render "user_sessions/show" }
      end
    end

  end

  def bubble_params
      params.require(:bubble).permit(:text, :id)
    end
end
