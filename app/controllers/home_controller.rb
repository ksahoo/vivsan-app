class HomeController < ApplicationController

	def sign_in
		
	end

	def sign_up
		@user 
	end

	def validate
		#render :text => params.inspect and return
		@user = UserData.find_by(email: params[:user][:email], password: params[:user][:password])
		if @user.nil?
			flash[:notice] = "Invalid Username or password."
			redirect_to(:action => 'sign_in')
		else
			@users = UserData.all
			if !@users.nil?
			render('index')
			end
		end
	end

	def view
		#@user = UserData.find_by(email: params[:user][:email], password: params[:user][:password])
		#if @user.nil?
			#@user = UserData.new(firstname: params[:user][:first_name],lastname: params[:user][:last_name], email: params[:user][:email], institution: params[:user][:institution], password: params[:user][:password])
			#@user.save()
			#@users = UserData.all
			#render ('index')
		#else
			#redirect_to(:action => 'sign_up')
		#end
		@user = UserData.find(params[:id])
	  if !@users.nil?  
	  	render ('view')  
	  end
	end

	def edit
		@user = UserData.find(params[:id])
	  if !@users.nil?  
	  	render ('edit')
	  end
	end

	def delete
		
	end

	def index
		@users = UserData.all
	end

	def update
		@user = UserData.find(params[:id])
		if @user.update_attributes(params.require(:user).permit(:firstname, :lastname, :email, :institution))
			render ('view')
		else
			render ('update')
		end
	end
end
