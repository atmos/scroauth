module Scro
  module Auth
    class Plan < Struct.new(:name, :collaborators, :space, :private_repos); end

    class User
      attr_reader :id, :login, :name, :company, :location, :email, :blog,
                  :following_count, :followers_count, :disk_usage,
                  :public_gist_count, :public_repo_count, :collaborators,
                  :private_gist_count, :owned_private_repo_count, :total_private_repo_count
                  :plan

      attr_reader :user_json

      def initialize(login, token)
        raise RequestError, "Token not configured" if token.nil? || token.empty?
        @login, @token = login, token

        discover
      end

      def repos
        @repos ||= get("repos/show/#{@login}")['repositories']
      end

      def watched_repos
        @watched_repos ||= get("repos/watched/#{@login}")['repositories']
      end

      private

      def discover
        @user_json = get("user/show/#{@login}")['user']

        user_json.each do |key, value|
          instance_variable_set("@key", value)
        end
      end

      def get(path)
        Scro::Auth.get(@token, path)
      end
    end
  end
end
