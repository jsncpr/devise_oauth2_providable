class Devise::Oauth2Providable::Client
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :redirect_uri, :type => String
  field :website, :type => String
  field :oauth_identifier, :type => String
  field :secret, :type => String

  index :oauth_identifier, :unique => true

  has_many :access_tokens, :class_name => "Devise::Oauth2Providable::AccessToken"
  has_many :refresh_tokens, :class_name => "Devise::Oauth2Providable::RefreshToken"
  has_many :authorization_codes, :class_name => "Devise::Oauth2Providable::AuthorizationCode"

  before_validation :init_oauth_identifier, :on => :create, :unless => :oauth_identifier?
  before_validation :init_secret, :on => :create, :unless => :secret?
  validates :website, :secret, :presence => true
  validates :name, :presence => true, :uniqueness => true
  validates :oauth_identifier, :presence => true, :uniqueness => true

  attr_accessible :name, :website, :redirect_uri

  private

  def init_oauth_identifier
    self.oauth_identifier = Devise::Oauth2Providable.random_id
  end
  def init_secret
    self.secret = Devise::Oauth2Providable.random_id
  end
end
