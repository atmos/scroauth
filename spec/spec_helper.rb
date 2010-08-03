require 'pp'
Bundler.require(:default, :runtime, :test)

$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')

require 'scroauth'
require 'config'

Spec::Runner.configure do |config|
  def random_digest
    Digest::SHA1.hexdigest(Time.now.to_f.to_s)
  end
end
