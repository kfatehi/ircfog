namespace :znc do
  namespace :test do
    ##
    # Installs ZNC 1.0 if not installed
    # Resets the ZNC configuration to defaults for testing
    task :prepare do
      if `hash znc > /dev/null 2>&1; echo $?`.strip.to_i == 0
        # Yes its installed
        # replace the config file
        puts "Replace the config file"
      else
        # install it
        # are we in mac?
        # Yes? 
        # Then brew install zsh if brew is installed
        raise "ZNC is not installed, cannot prepare for test"
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
