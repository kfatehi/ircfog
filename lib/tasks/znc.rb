namespace :znc do
  namespace :test do
    ##
    # Installs ZNC 1.0 if not installed
    # Resets the ZNC configuration to defaults for testing
    task :prepare do
      `hash znc ; echo $?`.strip == 0
      # First: Is it installed ?
      #        Is it v1.0 ?
      # If not, install v1.0
      # If yes -- reset the configuration
      # Reuse this code in spec_helper
      
    end
  end
end
