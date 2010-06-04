module Scro
  module Auth
    class User
      def initialize(login, token)
        @login, @token = login, token
      end
    end
  end
end
