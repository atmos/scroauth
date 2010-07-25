require 'pp'
Bundler.require(:default, :runtime, :test)

$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')

require 'scroauth'

raise ArgumentError unless ENV['USER'] == 'atmos'
Spec::Runner.configure do |config|
  config.before(:each) do
  end

  def ssh_contents
    File.read(File.expand_path("~/.ssh/id_dsa.pub"))
  end
end
