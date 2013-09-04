module ZNCTask
  module Helpers
    ##
    # Introspect about the platform
    def platform
      require 'rbconfig'
      @platform ||= Class.new do
        def initialize
          @os = RbConfig::CONFIG['host_os']
        end

        def windows?
          @os =~ /mswin|mingw|cygwin/
        end

        def mac?
          @os =~ /darwin/
        end

        def linux?
          @os =~ /linux/
        end

        def to_s
          @os
        end
      end.new
    end

    ##
    # Check is a program is installed
    def installed? command
      `hash #{command} > /dev/null 2>&1; echo $?`.strip.to_i == 0
    end
    
    ##
    # Install ZNC
    def install_znc
      if platform.mac?
        if installed? 'brew'
          puts "Install znc with homebrew? (y/N)"
          res = STDIN.gets.downcase.strip
          if res != "y"
            exit 1
          end
          system 'brew install znc'
        else
          puts "You need homebrew to install ZNC on Mac with this task"
        end
      else
        raise "Can't install ZNC on this OS automatically"
      end
    end

    ##
    # Check ZNC version
    def version_1_0?
      `znc --version`.match(/1\.0/)
    end
  end
end

namespace :znc do
  include ZNCTask::Helpers
  namespace :test do
    ##
    # Installs ZNC 1.0 if not installed
    # Resets the ZNC configuration to defaults for testing
    task :prepare do
      if installed? 'znc'
        puts "Replace the config file"
      else
        puts "ZNC is not installed."
        install_znc
      end
      puts "ZNC is now installed"
      if version_1_0?
      else
        puts "ZNC version mismatch. Install ZNC v1.0"
      end
      # First: Is it installed ?
      #        Is it v1.0 ?
      #
      # If not, install v1.0
      # If yes -- reset the configuration
      # Reuse this code in spec_helper
    end
  end
end
