require 'thor'

require_relative 'params'
require_relative 'add'
require_relative 'list'
require_relative 'remove'
require_relative 'new'
require_relative 'package'

module Scaffnew

    class Cli < Thor

        def self.exit_on_failure?
            true
        end

        desc('add URL [NAME]', "Add a new package")
        def add (*params)
            Add.new(self, params)
        end

        desc('list', "List all packages")
        def list (*params)
            List.new(self, params)
        end

        desc('remove NAME', "Remove a package")
        def remove (*params)
            Remove.new(self, params)
        end

        desc('new NAME', "Extract a package into the current folder")
        def new (*params)
            New.new(self, params)
        end

        desc('package', "Create a package from current folder")
        def package (*params)
            Package.new(self, params)
        end

        desc('version', "Display scaffnew version")
        map %w[-v --version] => :version
        def version
            say "Scaffnew version #{VERSION}"
        end

    end
end
