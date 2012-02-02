class Devise::Oauth2Providable::AuthorizationCode
  include Mongoid::Document
  include Mongoid::Timestamps
  include Devise::Oauth2Providable::ExpirableToken

  field :redirect_uri, :type => String

  index :client_id
  index :user_id
  index :token, :unique => true
  index :expires_at

  expires_according_to :authorization_code_expires_in
end
