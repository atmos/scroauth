require "spec_helper"

describe "User" do
  let(:user) { Scro::Auth::User.new(ENV['USER'], ENV['SCROAUTH_TOKEN']) }

  it "gets your repos" do
    repos = user.repos
    repos.should_not be_empty
  end

  it "gets watched repos" do
    repos = user.watched_repos
    repos.should_not be_empty
  end
end
