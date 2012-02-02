class Devise::Oauth2Providable::RefreshToken
  include Mongoid::Document
  include Mongoid::Timestamps
  include Devise::Oauth2Providable::ExpirableToken

  index :client_id
  index :user_id
  index :token, :unique => true
  index :expires_at

  expires_according_to :refresh_token_expires_in

  has_many :access_tokens, :class_name => "Devise::Oauth2Providable::AccessToken"
end
