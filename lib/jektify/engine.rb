module Jektify
  class Engine
    def gem_path
      @gem_path ||= File.expand_path '../..', File.dirname(__FILE__)
    end

    def assets_path
      File.join gem_path, 'assets'
    end

    def stylesheets_sass_path
      File.join assets_path, 'vendor/jektify/sass'
    end

    def yml_config(yml)
      YAML::load_file(File.join(yml))
    end

    def error_different_string(obj, opt_first, opt_secondy, msg)
      raise RuntimeError, "#{msg}" if obj != opt_first && obj != opt_secondy
    end

    def error_different_true_false(obj, msg)
      raise RuntimeError, "#{msg}" if obj != true && obj != false
    end

    def yml_verify(app_root_config)
      raise RuntimeError, "[x] Error: Configuration Jektify not found in  _config.yml. Aborted!" if app_root_config.nil?
    end

    def copy_sass_manual(app_root_config)
      return false if app_root_config["sass"].nil? || app_root_config["sass"]["other"]["dir"].nil?
      use_sass_jekyll = app_root_config["sass"]["jekyll"]
      dir_copy = File.join app_root_config["sass"]["other"]["dir"], 'jektify'
      if use_sass_jekyll == false
        # if !File.directory?(dir_copy)
        FileUtils::mkdir_p "#{dir_copy}" unless File.directory?(dir_copy)
        # end
        FileUtils.copy_entry stylesheets_sass_path, dir_copy
      end
    end

    # DEPRECATED
    # def parameter_user(input_split)
    #   input_split[0].strip
    # end

    def split_params(params)
      params.split("/")
    end

    def configure_sass(utils)
      require "sass"
      # DEPRECATED Bootstrap
      # require "bootstrap"
      # Inspired by bootstrap-sass
      ::Sass.load_paths << utils.stylesheets_sass_path
      ::Sass::Script::Number.precision = [8, ::Sass::Script::Number.precision].max
    end

  end # class Engine
end # module Jektify
