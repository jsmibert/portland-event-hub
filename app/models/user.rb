class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  include TheRole::User
  

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    if user = User.where(:provider => auth.provider, :uid => auth.uid).first
      user
    else
      user = User.new
      user
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
        user.uid = data["id"]
        user.provider = session["devise.facebook_data"]["provider"]
        user.name = data["name"]
      end
    end
  end
end
