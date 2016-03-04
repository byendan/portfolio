class BubblesController < ApplicationController
  def new
  end

  def show
  end

  def update
    @bub = Bubble.find(params[:format])
    if @bub.update_attributes(bubble_params)
      @bubbles = Bubble.all
      render "user_sessions/show"
    end
  end

  def bubble_params
      params.require(:bubble).permit(:text)
    end
end
