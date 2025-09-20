module Jektify
  class Engine
    require "fileutils"
    require "yaml"

    # Retorna o caminho raiz da gem
    def gem_path
      @gem_path ||= File.expand_path('../..', __dir__)
    end

    # Caminho para os assets dentro da gem
    def assets_path
      File.join(gem_path, 'assets')
    end

    # Caminho para os arquivos Sass da gem
    def stylesheets_sass_path
      File.join(assets_path, 'vendor/jektify/sass')
    end

    # Carrega um arquivo YAML
    def yml_config(yml)
      YAML.load_file(yml)
    end

    # Erros de validação
    def error_different_string(obj, opt_first, opt_secondy, msg)
      raise RuntimeError, msg if obj != opt_first && obj != opt_secondy
    end

    def error_different_true_false(obj, msg)
      raise RuntimeError, msg if obj != true && obj != false
    end

    # Verifica se a configuração existe
    def yml_verify(app_root_config)
      raise RuntimeError, "[x] Error: Configuration Jektify not found in _config.yml. Aborted!" if app_root_config.nil?
    end

    # Divide parâmetros do tag Liquid
    def split_params(params)
      params.split("/")
    end

    # Adiciona o caminho Sass da gem ao Jekyll/Dart Sass
    def configure_sass_for_jekyll(site)
      site.config["sass"] ||= {}
      site.config["sass"]["load_paths"] ||= []
      site.config["sass"]["load_paths"] << stylesheets_sass_path unless site.config["sass"]["load_paths"].include?(stylesheets_sass_path)
    end
  end
end
