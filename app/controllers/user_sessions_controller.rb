class UserSessionsController < ApplicationController
  skip_before_action :authorize, only: [:create, :new]

  def new
    @user_session = UserSession.new
  end

  def show
    @bubbles = Bubble.all
    @bub_count = Bubble.count

    unless @about_text = TextContent.find_by(parent: "about")
      about_params = {label: "Name your new about title", text: "Enter your about section text",
                      parent: "about", parent_class: ".about"}
      @about_text = TextContent.new(about_params)
      @about_text.save
    end

    @tags = Tag.all
    @projects = Project.all 

  end

  def create
    @user_session = UserSession.new(user_session_params)
    if @user_session.save
      flash[:success] = "Welcome back!"
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:success] = "Goodbye!"
    redirect_to root_path
  end

  private

  def user_session_params
    params.require(:user_session).permit(:email, :password, :remember_me)
  end
end
