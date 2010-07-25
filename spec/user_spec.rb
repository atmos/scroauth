require "spec_helper"

describe "User" do
  let(:user) { Scro::Auth::User.new(ENV['SCROAUTH_TOKEN'], 'atmos') }

  it "has simple accessors" do
    user['name'].should eql('Corey Donohoe')
    user['blog'].should eql('http://www.atmos.org')
    user['login'].should eql('atmos')
  end

  it "gets your repos" do
    user.repos.size.should be > 50
  end

  it "gets watched repos" do
    user.watched_repos.size.should be > 500
  end

  it "gets pushable repos" do
    pending "401s currently" do
      user.pushable_repos.size.should be > 50 #??
    end
  end
end
