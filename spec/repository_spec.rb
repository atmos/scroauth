require "spec_helper"

describe "Repository" do
  it "gets the repo" do
    pending "github needs to add deploy key access" do
      repo.should_not be_nil
    end
  end

  it "adds a deployment key to the repo" do
    pending "github needs to add deploy key adding"
    repo.add_deploy_key('cloud', ssh_contents)
  end
end
