class UsersController < ApplicationController
  def index
    @user = UserData.find_by(email: params[:user][:email], password: params[:user][:password])
    if !@user.nil?
      @users = UserData.all
      render('index')
    else
      flash[:error] = "Invalid email or password"
      render('sign_in')
    end
  end

  def new
    redirect_to(:action => 'sign_in')
  end

  def create
    @user_email = params[:user][:email]
    @user_password= params[:user][:password]  
    if @user_email = "" && @user_password = ""
      flash[:error] = "Invalid Credentials."
      render('sign_up')
    else
      @user = UserData.find_by(email: params[:user][:email])
      if !@user.nil?
        flash[:error] = "email already exists. Try a different one..."
      redirect_to(:action => 'sign_up')
      else
        @user = UserData.new(firstname: params[:user][:first_name],lastname: params[:user][:last_name], email: params[:user][:email], institution: params[:user][:institution], password: params[:user][:password])
        @user.save()
        flash[:error] = "Successfully registered. Now try logging in..."
        redirect_to(:action => 'new')
      end
    end
  end

  def edit
    @user = UserData.find(params[:id])
    if !@user.nil?
      render ('edit')
    end
  end

  def show
    @user = UserData.find(params[:id])
    if !@user.nil?
      render ('show')
    end
  end

  def update
    @user = UserData.find(params[:id])
    pp
    if @user.update_attributes(params.require(:user).permit(:firstname, :lastname, :email, :institution))
      @users = UserData.all
      render ('index')
    end
  end

  def delete
    @user = UserData.find(params[:id])
  end

  def destroy
    @user = UserData.find(params[:id])
    if @user.destroy
      redirect_to(:action => 'index')
    else
      render('destroy')
    end
  end

  def sign_in

  end

  def sign_up

  end
end
