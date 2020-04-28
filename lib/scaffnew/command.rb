require_relative "io"

module Scaffnew

    class Command

        def initialize (cli, param=nil)
            @cli = cli
            @io = IO.new()

            command(param)
        end

        def command (param)
            @cli.say "method \"command\" not found"
        end

        def say (message)
            @cli.say message
        end

        def success (message)
            @cli.say message
        end

        def error (message)
            raise Thor::Error, "Error: #{message}"
        end
    end
end
