require 'spec_helper'

describe Devise::Oauth2Providable::RefreshToken do
  describe 'basic refresh token instance' do
    with :client
    subject do
      Devise::Oauth2Providable::RefreshToken.create! :client => client
    end
    it { should validate_presence_of :token }
    it { should validate_uniqueness_of :token }
    it { should belong_to :user }
    it { should belong_to :client }
    it { should validate_presence_of :client }
    it { should validate_presence_of :expires_at }
    it { should have_many :access_tokens }
    # TODO Uncomment when mongoid-rspec bumps version (>= 1.4.5)
    #it { should have_index_for :client_id }
    #it { should have_index_for :user_id }
    #it { should have_index_for(:token).with_options(:unique => true) }
    #it { should have_index_for :expires_at }
  end
end
