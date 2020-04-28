require_relative "command"

module Scaffnew

    class Add < Command

        def command (params)

            p_url  = params[0]
            p_name = params[1]

            error "Package url is required" if p_url.nil?

            @workPath = @io.createWorkFolder()

            begin
                metadata = @io.downloadRemotePack(p_url, @workPath)
            rescue Exception => e
                roolback e.message
            end

            rollback "Invalid package metadata format" unless validateDataPack(metadata)

            p_name ||= metadata['name']

            roolback "'#{p_name}' already exist. Please change name or delete the current package" if @io.getPackage(p_name)

            @io.moveWorkToPackage(@workPath, p_name)

            success "Package #{p_name} successful instaled XD"

        end

        private

        def roolback (message)
            @io.removeWorkFolder(@workPath)
            error message
        end

        def validateDataPack (metadata)
            required = ['name', 'description', 'version'];

            required.each do |needed|
                if metadata[needed].nil? then
                    return false
                end
            end

            return true
        end

    end
end
