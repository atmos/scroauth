require "spec_helper"

describe "Scro::Auth::Key" do
  let(:key)     { Scro::Auth::Key.new }

  it "is ok if ssh-keygen is found in $PATH" do
    lambda {
      key.should_not be_nil
    }.should_not raise_error(ArgumentError)
  end

  it "handles custom keygen executables" do
    lambda {
      Scro::Auth::Key.new('non-existent-binary-script')
    }.should raise_error(ArgumentError)
  end

  it "can read the public key" do
    lambda {
      File.read(key.public_key)
    }.should_not raise_error
  end
  it "can read the private key" do
    lambda {
      File.read(key.private_key)
    }.should_not raise_error
  end
end
