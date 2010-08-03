module Scro
  module Auth
    class Key
      def initialize(keygen = 'ssh-keygen')
        @keygen   =  keygen
        @filename = Digest::SHA1.hexdigest(Time.now.to_f.to_s)

        generate
      end

      def generate
        ensure_ssh_keygen_present
        `#{@keygen} -f #{private_key} -P '' > #{stdout} 2>#{stderr}`
      end

      def ensure_ssh_keygen_present
        `which #{@keygen}`
        raise ArgumentError, "Unable to find the ssh-keygen executable" unless $?.success?
      end

      def private_key
        "#{Dir.tmpdir}/#{@filename}"
      end

      def public_key
        "#{private_key}.pub"
      end

      def stderr
        stdout('error')
      end

      def stdout(suffix = 'out')
        "#{private_key}.#{suffix}.log"
      end
    end
  end
end
