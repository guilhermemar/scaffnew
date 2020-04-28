require_relative "command"

module Scaffnew

    class New < Command

        def command (params)

            p_name = params[0]
            p_dest = "."

            error "Package name param uninformed" if p_name.nil?

            metadata = @io.getPackage(p_name)

            error "Package '#{p_name}' not found" if metadata.nil?

            @io.extractPackage(p_name, p_dest)

            success "Package #{p_name} successful extracted"

        end

    end

end
