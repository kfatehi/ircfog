require 'znc/config_helpers'
require 'fileutils'

module ZNCTask
  module Helpers
    ##
    # Introspect about the platform
    def platform
      require 'rbconfig'
      @platform ||= Class.new do
        def mac?
          RbConfig::CONFIG['host_os'] =~ /darwin/
        end
      end.new
    end

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
      if platform.mac?
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

    include ZNC::ConfigHelpers
  end
end

namespace :znc do
  include ZNCTask::Helpers

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
          use_znc_config("test")
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
