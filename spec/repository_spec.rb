require "spec_helper"

describe "Repository" do
  let(:repo) { Scro::Auth::Repository.new(ENV['SCROAUTH_TOKEN'], 'atmos', 'scroauth') }

  it "gets the repo" do
    repo.info['url'].should eql('http://github.com/atmos/scroauth')
    repo.info['owner'].should eql('atmos')
  end

  it "retrieves the deploy keys for repos" do
    repo.deploy_keys.should be_empty
  end

  it "adds a deployment key to the repo" do
    let(:key) { File.ready(Scro::Auth::Key.new.public_key) }
    pending "still 401s" do
      repo.add_deploy_key('cloud', key)
    end
  end
end
