module Scro
  module Auth
    class Repository < Request
      def initialize(token, name)
        super(token)
        @name = name
      end

      def add_deploy_key(title, key)
        post("repos/key/#{@name}", {:title => title, :key => key})
      end

      private
      def info
        @info = get("repos/keys/#{@name}")
      end
    end
  end
end
