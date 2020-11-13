class User < ApplicationRecord
  has_many :drink_orders
  has_many :drinks, through: :drink_orders
  devise :database_authenticatable, :registerable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  #for omniauth


  #validates oauth
    def self.from_google(uid:, email:, full_name:, avatar_url:)
    user = User.find_or_create_by(email: email) do |u|
      u.uid = uid
      u.full_name = full_name
      u.avatar_url = avatar_url
      u.password = SecureRandom.hex
    end
    user.update(uid: uid, full_name: full_name, avatar_url: avatar_url)
    user
  end
end

