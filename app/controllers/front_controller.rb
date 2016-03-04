class FrontController < ApplicationController
  skip_before_action :authorize
  def show
    @bubbles = Bubble.all
  end

end
