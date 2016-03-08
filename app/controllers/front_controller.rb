class FrontController < ApplicationController
  skip_before_action :authorize
  def show
    @bubbles = Bubble.all
    @about_text = TextContent.find_by(parent: "about")
  end

end
