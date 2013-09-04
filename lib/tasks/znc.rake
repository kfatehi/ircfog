require 'znc/setup'
require 'znc/config'

namespace :znc do
  include ZNC::Config
  include ZNC::Setup

  task :start do
    if File.directory? config_path
      system "znc -f -d #{config_path}"
    else
      puts "No ZNC config found."
      puts "If this is a test environment run rake znc:test:prepare"
    end
  end

  namespace :test do
    ##
    # Installs ZNC 1.0 if not installed
    # Resets the ZNC configuration to defaults for testing
    task :prepare do
      if installed? 'znc'
        if version_1_0?
          replace_znc_config("test")
        else
          puts "ZNC version mismatch. Please use ZNC v1.0"
        end
      else
        puts "ZNC is not installed."
        install_guide
        puts "Once installed, run again to configure ZNC for test"
        exit 1
      end
    end
  end
end
