require 'spec_helper'

describe Devise::Oauth2Providable::Client do
  describe 'basic client instance' do
    with :client
    subject { client }
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
    it { should allow_mass_assignment_of :name }
    it { should validate_presence_of :website }
    it { should allow_mass_assignment_of :website }
    it { should allow_mass_assignment_of :redirect_uri }
    it { should validate_uniqueness_of :oauth_identifier }
    # TODO Uncomment when mongoid-rspec bumps version (>= 1.4.5)
    #it { should have_index_for(:oauth_identifier).with_options(:unique => true) }
    it { should_not allow_mass_assignment_of :oauth_identifier }
    it { should_not allow_mass_assignment_of :secret }
    it { should have_many :refresh_tokens }
    it { should have_many :authorization_codes }
  end
end
