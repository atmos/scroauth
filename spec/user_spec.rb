require "spec_helper"

describe "Scro::Auth::User" do
  let(:user) { Scro::Auth::User.new(SCROAUTH_TOKEN, SCROAUTH_USER) }

  it "has simple accessors" do
    user["name"].should  eql(SCROAUTH_FULLNAME)
    user["blog"].should  eql(SCROAUTH_WEBSITE)
    user["login"].should eql(SCROAUTH_LOGIN)
  end

  it "gets your repos" do
    user.repos.size.should be > SCROAUTH_REPO_COUNT
  end

  it "gets your ssh keys" do
    user.ssh_keys.size.should eql(SCROAUTH_SSH_KEY_COUNT)
  end

  it "gets watched repos" do
    user.watched_repos.size.should be > SCROAUTH_WATCHED_REPO_COUNT
  end

  it "gets pushable repos" do
    pending "401s currently" do
      user.pushable_repos.size.should be > SCROAUTH_PUSHABLE_REPO_COUNT
    end
  end
end
