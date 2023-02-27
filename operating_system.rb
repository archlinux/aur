module Gem

  class << self

    remove_method :install_extension_in_lib
    def install_extension_in_lib
      false
    end

    remove_method :default_install
    def default_install
      @default_install ||= user_dir
    end

  end

end
