class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         # thêm tính năng
         :confirmable, :trackable, :lockable, 
         :omniauthable, omniauth_providers: [:google_oauth2, :facebook]

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(
           email: data['email'],
           password: Devise.friendly_token[0,20]
        )
    end
    user.confirmed_at = DateTime.now
    user
  end
end
