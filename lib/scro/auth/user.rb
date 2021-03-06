module Scro
  module Auth
    class User < Request
      attr_reader :user_json

      def initialize(token, login)
        super(token)
        @login = login
      end

      def [](key)
        info[key]
      end

      def ssh_keys
        @ssh_keys ||= get("user/keys")["public_keys"]
      end

      def repos
        @repos ||= get("repos/show/#{@login}")["repositories"]
      end

      def watched_repos
        @watched_repos ||= get("repos/watched/#{@login}")["repositories"]
      end

      def pushable_repos
        @pushable_repos ||= get("repos/pushable")["repositories"]
      end

      def info
        @info ||= get("user/show/#{@login}")["user"]
      end
    end
  end
end
