module ZNC
  module ConfigHelpers
    def config_path
      Rails.root.join("config", "znc", "main")
    end

    def config_template_path env
      Rails.root.join("config", "znc", "template", env)
    end

    ##
    # Replace ZNC config with a template
    def use_znc_config env
      FileUtils.rm_rf(config_path) if File.directory?(config_path)
      FileUtils.cp_r config_template_path(env), config_path
    end
  end
end
