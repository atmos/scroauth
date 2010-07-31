require "spec_helper"

describe "Repository" do
  let(:repo) { Scro::Auth::Repository.new(ENV['SCROAUTH_TOKEN'], 'atmos', 'scroauth') }

  it "gets the repo" do
    repo.info['url'].should eql('http://github.com/atmos/scroauth')
    repo.info['owner'].should eql('atmos')
  end

  it "adds a deployment key to the repo" do
    pending "still 401s" do
      repo.add_deploy_key('cloud', ssh_contents)
    end
  end
end
