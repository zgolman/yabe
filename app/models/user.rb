class User < ActiveRecord::Base
	has_many :photos
	has_many :auctions
	has_secure_password

  	validates_uniqueness_of :email

end
