class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, status: :see_other
    else
      render :new, status: :unprocessable_entity # Code 422 for Syntax correct but Semantically incorrect)
    end
  end

  def signin_form
  end

  def signin
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Signed in successfully!"
      redirect_to articles_path
    else
      flash.now[:alert] = "Invalid email or password"
      render :signin_form
    end
  end

  private
    # Params
    def user_params
      params.expect(user: [ :first_name, :last_name, :email, :password ])
    end
end
