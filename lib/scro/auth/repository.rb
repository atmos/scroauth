module Scro
  module Auth
    class Repository < Request
      def initialize(token, user, name)
        super(token)
        @user, @name = user, name
      end

      def add_deploy_key(title, key)
        post("repos/keys/#{@name}/add", {:title => title, :key => key})
      end

      def info
        @info ||= get("repos/show/#{@user}/#{@name}")['repository']
      end
    end
  end
end
