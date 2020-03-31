class SessionsController < ApplicationController

  def new
    # it will simply going to render a form
  end

  def create
    # the form submission wil be handled by create, starting the session and
    # displaying the user in a logged in state.
    # render.new
    # debugger
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end

  end

  def destroy
    # needed for logging out, will stop the session and move the user to the
    # logged out state
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path

  end

end
