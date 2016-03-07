class BubblesController < ApplicationController
  def new
  end

  def show
  end

  def create
    @bubble = Bubble.new
    @bubble.text = "Edit this bubble"
    respond_to do |format|
      if @bubble.save
        @bubble.update_attributes(bub_num: @bubble.id)
        @bub_total = Bubble.count
        format.html {render "user_sessions/show"}
        format.js
      else
        flash[:alert] = "Bubble not created successfully"
        fomat.html {render "user_sessions/show"}
      end
    end
  end

  def update
    @bub = Bubble.find(params[:id])
    @bub_num = params[:id]

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

  private

    def bubble_params
      params.require(:bubble).permit(:text, :id)
    end
end
