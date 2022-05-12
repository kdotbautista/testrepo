class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :omniauthable

  has_one :speaker

  attr_accessible :handle, :password
  attr_accessible :provider, :uid

  def self.find_for_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(
          provider:auth.provider,
          uid:auth.uid,
          handle:auth.info.nickname,
          password:Devise.friendly_token[0,20],
      )
      user.create_speaker(
          name:auth.extra.raw_info.name,
          email: auth.extra.raw_info.email.present? ? auth.extra.raw_info.email :  ""
      )
    end

    user
  end
end
