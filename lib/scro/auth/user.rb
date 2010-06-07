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

      def repos
        @repos ||= get("repos/show/#{@login}")['repositories']
      end

      def watched_repos
        @watched_repos ||= get("repos/watched/#{@login}")['repositories']
      end

      def info
        @info ||= get("user/show/#{@login}")['user']
      end
    end
  end
end
