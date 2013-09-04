module ZNC
  module Setup
    ##
    # Check is a program is installed
    def installed? command
      `hash #{command} > /dev/null 2>&1; echo $?`.strip.to_i == 0
    end

    ##
    # Check ZNC version
    def version_1_0?
      `znc --version`.match(/1\.0/)
    end

    ##
    # Assist in installing ZNC on my platform
    def install_guide
      mac_os = RbConfig::CONFIG['host_os'] =~ /darwin/
      if mac_os
        if installed? 'brew'
          puts "Please install ZNC with Homebrew:"
          puts "  brew install znc"
        else
          puts "Please install ZNC"
        end
      else
        raise "Can't install ZNC on this OS automatically"
      end
    end
  end
end

