module Jektify

  class Render

    $DATETIME = Time.new

    def rendering(app_name, app_root_config, spotify_embed_category, spotify_embed_url, spotify_embed_theme)

      # Checks the state of the description" property in the file "_config.yml"
      # jektify__description = app_root_config["title"]["enable"] == false and app_root_config["description"]["enable"] == false ? jektify__description = "none" : jektify__description = "block"

      # Checks the state of the "title => enable" property in the file "_config.yml"
      jektify__title = app_root_config["title"]["enable"] == true ? jektify__title = "block" : jektify__title = "none"

      # Checks the state of the "title => enable" property in the file "_config.yml"
      jektify__description = app_root_config["description"]["enable"] == true ? jektify__description = "block" : jektify__description = "none"

      # Sets the size of the box where the tracks will stay.
      spotify_embed_category == "album" || spotify_embed_category == "playlist" || spotify_embed_category == "artist" ? box_height = 380 : box_height = 80

      # Sets whether the Jektify box will start open or closed
      open_track = app_root_config["open"] == true ? open_track = "block" : open_track = "none"

      # If the option to open the box at startup is enabled, the toggle button will also undergo open and close actions.
      jektify__button_action = app_root_config["open"] == true ? jektify__button_action = "jektify__button--open" : jektify__button_action = "jektify__button--closed"

      # Checks whether the user will use the Toggle feature or not.
      # If do not use it, JavaScript will not be generated for the user. Because it is he who does the Toggle feature.
      # The block generating Javascript is in the "Generator" class in the "generate" method. Version 3.0.1
      # NOTe: If the user uses the previous version of the "_config.yml" file, there will be no conflict.
      jektify__toggle_button = "<span class=\"jektify__button jektify__button--#{spotify_embed_theme} jektify__button--custom #{jektify__button_action}\">+</span>" if app_root_config["toggle"].nil? || app_root_config["toggle"]["enable"] == true

      open_track = "block" if !app_root_config["toggle"].nil? && app_root_config["toggle"]["enable"] == false
      jektify__toggle_button = "" if !app_root_config["toggle"].nil? && app_root_config["toggle"]["enable"] == false

      # This is a feature for adding a Spotify user link. Version 3.0.1
      # NOTe: If the user uses the previous version of the "_config.yml" file, there will be no conflict.
      if app_root_config["spotify"].nil?
        jektify__spotify_user = ""
      else
        jektify__spotify_user = "<div class=\"jektify__user\"><a href=\"https://open.spotify.com/user/#{app_root_config["spotify"]["user"]}\" target=\"_blank\" class=\"jektify__user-link jektify__user-link--#{spotify_embed_theme} jektify__user-link--custom\" title=\"#{app_root_config["spotify"]["text"]}\"><span class=\"jektify__user-text jektify__user-text--#{spotify_embed_theme} jektify__user-text--custom\">#{app_root_config["spotify"]["text"]}</span></a></div>" if !app_root_config["spotify"]["user"].nil? && !app_root_config["spotify"]["text"].nil?
      end

      
     # Render template if enable == true
     if app_root_config["enable"] == true
        %(<dl class="jektify jektify--#{spotify_embed_theme} jektify--custom">

          <dt class="jektify__header jektify__header--#{spotify_embed_theme} jektify__header--custom">

            <a class="jektify__brand jektify__brand--#{spotify_embed_theme} jektify__brand--custom" href="https://#{app_name}.github.io" target="_blank">#{app_name}</a>

            <i class="jektify__year jektify__year--#{spotify_embed_theme} jektify__year--custom">&copy;&nbsp;#{$DATETIME.strftime("%Y")}&nbsp;</i>
              #{jektify__toggle_button}
          </dt>

          <dd class="jektify__body jektify__body--#{spotify_embed_theme} jektify__body--custom" style="display: #{open_track}">

            #{jektify__spotify_user}

            <h1 class="jektify__title jektify__title--#{spotify_embed_theme} jektify__user--#{spotify_embed_theme} jektify__title--custom" style="display: #{jektify__title};">#{app_root_config["title"]["text"]}</h1>

            <p class="jektify__description jektify__description--#{spotify_embed_theme} jektify__description--custom" style="display: #{jektify__description};">#{app_root_config["description"]["text"]}</p>

            <div class="jektify__tracklist jektify__tracklist--#{spotify_embed_theme} jektify__tracklist--custom">
              <iframe id="jektify__track" class="jektify__track jektify__track--#{spotify_embed_theme} jektify__track--custom" src="#{spotify_embed_url}" width="100%" height="#{box_height}" frameborder="0" allowtransparency="true"></iframe>
            </div>
          </dd>
        </dl>)
      end

    end # def content

  end # class Render

end # module Jektify
