require 'open-uri'
require 'yaml'
require 'yaml/store'
require 'time'
#require 'dir'

require_relative 'params.rb'

module Scaffnew
    class IO

        def initialize ()
            prepareLocalFolder()
        end

        # WORK TOOLS

        def createWorkFolder ()
            path = "#{LOCAL_WORK_PATH}/work_#{Time.now.getutc.to_i}";
            FileUtils.mkdir_p(path)
            return path
        end

        def removeWorkFolder (path)
            FileUtils.rm_rf(path)
        end

        def downloadRemotePack (url, workPath)
            `wget -q #{url} -O #{workPath}/package.scaff`
            `tar -xvf #{workPath}/package.scaff -C #{workPath}`

            return YAML.load_file("#{workPath}/metadata")
        end

        def moveWorkToPackage (workPath, packageName)
            FileUtils.rm("#{workPath}/package.scaff")
            FileUtils.mv(workPath, "#{LOCAL_REPO_PATH}/#{packageName}")
        end

        def createData (path, workPath)
            files = (Dir.entries(path) - ['.', '..']) * ' '
            `tar -zcf #{workPath}/data.tar.gz -C #{path} #{files}`
        end

        def createMetadata (metadata, workPath)
            store = YAML::Store.new("#{workPath}/metadata")
            store.transaction do
                metadata.each do |key, value|
                    store[key.to_s] = value
                end
            end
        end

        def packageWork (name, workPath)
            `tar -cf #{name}.scaff -C #{workPath} data.tar.gz metadata`
        end

        # PACKAGE MANIPULATION

        def getPackage (name)
            return packageInfo(name)
        end

        def getAllPackages ()
            packages = []

            Dir.glob("#{LOCAL_REPO_PATH}/*") do |path|
                if File.directory?(path) then
                    packages << packageInfo(File.basename(path))
                end
            end

            return packages
        end

        def extractPackage (name, dest)
            path = "#{LOCAL_REPO_PATH}/#{name}/#{PACKAGE_DATA_NAME}"
            `tar -zxf #{path} -C #{dest}`
        end

        def removePackageFolder (name)
            FileUtils.rm_rf("#{LOCAL_REPO_PATH}/#{name}")
        end

        private

        def createLocalFolders ()
            FileUtils.mkdir_p(LOCAL_REPO_PATH)
            FileUtils.mkdir_p(LOCAL_WORK_PATH)
        end

        def prepareLocalFolder ()
            if !File.directory?(LOCAL_PATH) then
                createLocalFolders()
            end
        end

        def packageInfo (name)
            path = "#{LOCAL_REPO_PATH}/#{name}"

            begin
                return {
                    name: name,
                    meta: YAML.load_file("#{path}/#{PACKAGE_METADATA_NAME}"),
                    data: "#{path}/#{PACKAGE_DATA_NAME}"
                }
            rescue
                return nil
            end

        end

    end
end
