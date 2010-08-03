require "spec_helper"

describe "Scro::Auth::Repository" do
  let(:key) { File.read(Scro::Auth::Key.new.public_key) }
  let(:repo) { Scro::Auth::Repository.new(SCROAUTH_TOKEN, SCROAUTH_USER, SCROAUTH_TEST_PROJECT) }

  it "gets the repo" do
    repo.info['url'].should eql('http://github.com/atmos/scroauth')
    repo.info['owner'].should eql('atmos')
  end

  it "retrieves the deploy keys for repos" do
    repo.deploy_keys.should be_empty
  end

  it "adds a deployment key to the repo" do
    repo.add_deploy_key(random_digest, key)
  end
end
