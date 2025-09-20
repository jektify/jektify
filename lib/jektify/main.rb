require "jekyll"
require "yaml"
require "find"
require "fileutils"
require "liquid"

module Jektify
  APP_NAME = "jektify"

  class Generator < Jekyll::Generator
    safe true
    priority :normal

    def generate(site)
      engine = Engine.new
      render_obj = Render.new
      config = engine.yml_config('_config.yml')[APP_NAME]

      # Verifica se a configuração existe
      engine.yml_verify(config)

      @site = site

      # Configura Sass para Jekyll
      engine.configure_sass_for_jekyll(site)

      # Copia arquivos estáticos caso toggle esteja habilitado
      if config["enable"] == true
        @site.static_files.concat static_files(engine) if config["toggle"].nil? || config["toggle"]["enable"] == true
      end
    end

    private

    # Lista arquivos estáticos (exceto Sass)
    def static_files(engine)
      source = File.dirname(engine.assets_path)
      asset_files(engine).map do |file|
        dir = File.dirname(file)
        file_name = File.basename(file)
        Jekyll::StaticFile.new(@site, source, dir, file_name)
      end
    end

    def asset_files(engine)
      files = []
      Find.find(engine.assets_path).each do |path|
        next if File.directory?(path)
        next if path.include?(engine.stylesheets_sass_path)
        files << path.sub(engine.assets_path, 'assets')
      end
      files
    end
  end

  class Main < Liquid::Tag
    def initialize(tag_name, input, tokens)
      super
      @input = input
    end

    def render(context)
      engine = Engine.new
      render_obj = Render.new
      config = engine.yml_config('_config.yml')[APP_NAME]

      # Split do input e configurações do Spotify
      input_split = engine.split_params(@input)
      spotify_user = input_split[0].strip
      spotify_embed_category = input_split[1].strip
      spotify_id = input_split[2].strip
      spotify_embed_theme = input_split[3].strip
      spotify_embed_theme = spotify_embed_theme == "light" ? "white" : spotify_embed_theme

      engine.error_different_string(
        spotify_embed_theme,
        "dark",
        "white",
        "[x] Error: Parameter incorrect in {% spotify [user]/[type]/[id]/[theme] %}."
      )

      player_color = spotify_embed_theme == "dark" ? "0" : "1"
      spotify_embed_url = "https://open.spotify.com/embed/#{spotify_embed_category}/#{spotify_id}?theme=#{player_color}"

      # Validações das configs
      %w[enable open].each do |key|
        engine.error_different_true_false(config[key], "[x] Error: The property 'spotify => #{key}' in '_config.yml' is missing or invalid.") unless config[key].nil?
      end

      if config["title"]
        engine.error_different_true_false(config["title"]["enable"], "[x] Error: The property 'spotify => title => enable' in '_config.yml' is missing or invalid.") unless config["title"].nil?
      end

      if config["description"]
        engine.error_different_true_false(config["description"]["enable"], "[x] Error: The property 'spotify => description => enable' in '_config.yml' is missing or invalid.") unless config["description"].nil?
      end

      if config["toggle"]
        engine.error_different_true_false(config["toggle"]["enable"], "[x] Error: The property 'spotify => toggle => enable' in '_config.yml' is missing or invalid.") unless config["toggle"].nil?
      end

      # Renderiza o player
      render_obj.rendering(APP_NAME, config, spotify_embed_category, spotify_embed_url, spotify_embed_theme)
    end
  end

  # Registra a tag Liquid
  Liquid::Template.register_tag(APP_NAME, Jektify::Main)
end
