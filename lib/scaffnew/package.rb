require_relative "command"

module Scaffnew

    class Package < Command

        def command (params)

            p_path = "."

            answer_name        = @cli.ask("Package name (without spaces)")
            answer_description = @cli.ask("Package description")
            answer_version     = @cli.ask("Package version")

            @workPath = @io.createWorkFolder()

            begin
                @io.createData(p_path, @workPath)
            rescue Exception => e
                roolback e.message
            end

            metadata = {
                name: answer_name,
                description: answer_description,
                version: answer_version
            }

            begin
                @io.createMetadata(metadata, @workPath)
            rescue Exception => e
                roolback e.message
            end

            begin
                @io.packageWork("#{answer_name}", @workPath)
            rescue Exception => e
                roolback e.message
            end

            @io.removeWorkFolder(@workPath)
        end

        private

        def roolback (message)
            @io.removeWorkFolder(@workPath)
            error message
        end

    end
end
