class FrontController < ApplicationController
  def show
    @bubbles = Bubble.all;
  end

end
