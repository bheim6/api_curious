class User < ApplicationRecord
  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid = auth_info.uid
      new_user.repos_url = auth_info.extra.repos_url
      new_user.client_id = auth_info.client_id
      new_user.client_secret = auth_info.client_secret
    end
  end
end
