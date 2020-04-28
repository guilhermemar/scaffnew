require_relative "command"

module Scaffnew

    class Remove < Command

        def command (params)

            p_name = params[0]

            error "Package name param uninformed" if p_name.nil?

            metadata = @io.getPackage(p_name)

            error "Package #{p_name} not found" if metadata.nil?

            realy = @cli.ask("Do you realy want remove #{p_name}?", :limited_to => ["y", "n"])

            if realy == 'n' then
                return
            end

            @io.removePackageFolder(p_name)
            success "Package #{p_name} removed"

        end

    end
end
