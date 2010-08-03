require 'pp'
Bundler.require(:default, :runtime, :test)

$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')

require 'scroauth'

raise ArgumentError unless ENV['USER'] == 'atmos'
Spec::Runner.configure do |config|
  def ssh_contents
    File.ready(Scro::Auth::Key.new.public_key)
  end
end
