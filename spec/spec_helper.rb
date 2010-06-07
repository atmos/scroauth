require 'pp'
Bundler.require(:default, :runtime, :test)

$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')

require 'scroauth'

raise ArgumentError unless ENV['USER'] == 'atmos'
Spec::Runner.configure do |config|
  config.before(:each) do
  end
end
