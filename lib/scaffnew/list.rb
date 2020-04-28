require_relative "command"

module Scaffnew

    class List < Command

        def command (params)
            @io.getAllPackages().each do |package|
                say "  #{package[:name]}    #{package[:meta]["description"]}"
            end

        end

    end
end
