module Scaffnew

    VERSION = "1.0.0.rc"

    LOCAL_PATH      = File.expand_path("~/.scaffnew")
    LOCAL_REPO_PATH = File.expand_path("#{LOCAL_PATH}/repositories")
    LOCAL_WORK_PATH = File.expand_path("#{LOCAL_PATH}/working")

    PACKAGE_DATA_NAME     = "data.tar.gz"
    PACKAGE_METADATA_NAME = "metadata"

end
