class UserData < ActiveRecord::Base

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\z/i
	validates_presence_of :firstname
	validates_length_of :firstname, :within => 5..15
	validates_presence_of :email
	validates_uniqueness_of :email
	validates_format_of :email, :with => EMAIL_REGEX
	validates_presence_of :password
	validates_length_of :password, :within => 5..15
	validates_confirmation_of :password
end
