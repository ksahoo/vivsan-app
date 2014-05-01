class UsersController < ApplicationController
  def index
    @users = UserData.all
  end

  def new
    redirect_to(:action => 'sign_in')
  end

  def create 
    @user = UserData.find_by(email: params[:user][:email], password:
      params[:user][:password])
    if @user.nil?
      @user = UserData.new(firstname: params[:user][:first_name],lastname: params[:user][:last_name], email: params[:user][:email], institution: params[:user][:institution], password: params[:user][:password])
      @user.save()
      redirect_to(:action => 'new')
    else
      redirect_to(:action => 'sign_up')
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
