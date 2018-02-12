# Required libs
require "jekyll"
require "yaml"
require "benchmark"
require "find"
require "fileutils"
require "open-uri"


module Jektify

  # Instance class
  ENGINE = Engine.new
  RENDER = Render.new

  # Variables global
  APP_NAME = "jektify"
  YML_LOAD = ENGINE.yml_config('_config.yml')
  APP_ROOT_CONFIG = YML_LOAD["#{APP_NAME}"]


  class Generator < Jekyll::Generator

    def generate(site)
      # Before, verify structure Jektify in _config.yml
      ENGINE.yml_verify(APP_ROOT_CONFIG)

      @site = site

      # It will only generate the Javascript file for the user, if the 'Toggle' feature is enabled in the file "_config.yml".
      if APP_ROOT_CONFIG["enable"] == true
        @site.static_files.concat static_files if APP_ROOT_CONFIG["toggle"].nil? || APP_ROOT_CONFIG["toggle"]["enable"] == true
      end
      ENGINE.copy_sass_manual(APP_ROOT_CONFIG)
    end

    # This method searches for folders and files in the assets root directory.
    # After searching all files stores in an array and then copying to
    # the folder "_site".
    def static_files
      source = File.dirname(ENGINE.assets_path)
      asset_files.map do |file|
        dir = File.dirname(file)
        file_name = File.basename(file)
        Jekyll::StaticFile.new @site, source, dir, file_name
      end
    end

    # Get paths and fils directory 'assets'
    def asset_files
      asset_files = []
      Find.find(ENGINE.assets_path).each do |path|
        next if File.directory?(path)
        next if path.include?(ENGINE.stylesheets_sass_path)
        asset_files << path.sub(ENGINE.assets_path, 'assets')
      end
      asset_files
    end

  end # Generator

  # class load SASS
  class << self

    def loadSass
      ENGINE.configure_sass(ENGINE)
    end

  end # self

  # Implement Jektify in Page
  class Main < Liquid::Tag

    def initialize(tag_name, input, tokens)
      super
      # Name tag in liquid
      # @tag_name = tag_name # DEPRECATED
      @input = input
    end

    def render(context)
      # Sets the data splitter
      input_split = ENGINE.split_params(@input)

      # Determines the positions of each data with the divisor
      spotify_user = input_split[0].strip
      spotify_embed_category = input_split[1].strip
      spotify_id = input_split[2].strip
      spotify_embed_theme = input_split[3].strip

      # Transpiler variable "theme"
      spotify_embed_theme == "light" ? spotify_embed_theme = "white" : spotify_embed_theme = input_split[3].strip

      # Checks a series of error values in the settings of Jektify in sctructure {% spotify [user]/[type]/[id]/[theme] %}
      ENGINE.error_different_string(spotify_embed_theme, "dark", "white", "[x] Error: Parameter incorrect in {% spotify [user]/[type]/[id]/[theme] %}.")

      # Customizing Url Spotify
      # E.g: { % spotify [user]/[type]/[id]/[theme] % }
      spotify_embed_url = "https://embed.spotify.com/?uri=spotify:#{spotify_embed_category}:#{spotify_id}&theme=#{spotify_embed_theme}"
      spotify_embed_url = "https://embed.spotify.com/?uri=spotify:user:#{spotify_user}:#{spotify_embed_category}:#{spotify_id}&theme=#{spotify_embed_theme}" unless spotify_embed_category != "playlist"


      # Checks a series of error values in the settings of Jektify in _config.yml
      ENGINE.error_different_true_false(APP_ROOT_CONFIG["enable"], "[x] Error: The property 'spotify => enable' in file '_config.yml' does not exist or its value is incorrect. Use: [ true | false ]") unless APP_ROOT_CONFIG["enable"].nil?


      ENGINE.error_different_true_false(APP_ROOT_CONFIG["open"], "[x] Error: The property 'spotify => open' in file '_config.yml' does not exist or its value is incorrect. Use: [ true | false ]") unless APP_ROOT_CONFIG["open"].nil?

      ENGINE.error_different_true_false(APP_ROOT_CONFIG["title"]["enable"], "[x] Error: The property 'spotify => title => enable' in file '_config.yml' does not exist or its value is incorrect. Use: [ true | false ]") unless APP_ROOT_CONFIG["title"].nil?

      ENGINE.error_different_true_false(APP_ROOT_CONFIG["description"]["enable"], "[x] Error: The property 'spotify => description => enable' in file '_config.yml' does not exist or its value is incorrect. Use: [ true | false ]") unless APP_ROOT_CONFIG["description"].nil?

      ENGINE.error_different_true_false(APP_ROOT_CONFIG["toggle"]["enable"], "[x] Error: The property 'spotify => toggle => enable' in file '_config.yml' does not exist or its value is incorrect. Use: [ true | false ]") unless APP_ROOT_CONFIG["toggle"].nil?

      # If there are no errors starting the plugin
      RENDER.rendering(APP_NAME, APP_ROOT_CONFIG, spotify_embed_category, spotify_embed_url, spotify_embed_theme)

    end # def render

  end # class Main

  # Load files: (SASS)
  Jektify.loadSass

  # Register plugin (tag)
  Liquid::Template.register_tag(APP_NAME, Jektify::Main)

end # module Jektify
