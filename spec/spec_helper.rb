require 'pp'
Bundler.require(:default, :runtime, :test)

$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')

require 'scroauth'

Spec::Runner.configure do |config|
  config.before(:each) do
  end
end
