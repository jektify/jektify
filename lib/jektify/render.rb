module Jektify
  class Render
    $DATETIME = Time.now

    def rendering(app_name, app_root_config, category, url, theme)
      jektify_title = app_root_config.dig("title", "enable") ? "block" : "none"
      jektify_description = app_root_config.dig("description", "enable") ? "block" : "none"
      box_height = %w[album playlist artist].include?(category) ? 380 : 80
      open_track = app_root_config["open"] ? "block" : "none"
      button_action = app_root_config["open"] ? "jektify__button--open" : "jektify__button--closed"

      toggle_button = if app_root_config.dig("toggle", "enable").nil? || app_root_config.dig("toggle", "enable")
                        "<span class=\"jektify__button jektify__button--#{theme} jektify__button--custom #{button_action}\">+</span>"
                      else
                        ""
                      end

      open_track = "block" if app_root_config.dig("toggle", "enable") == false

      spotify_user_html = ""
      if app_root_config["spotify"]
        user = app_root_config["spotify"]["user"]
        text = app_root_config["spotify"]["text"]
        if user && text
          spotify_user_html = <<~HTML
            <div class="jektify__user">
              <a href="https://open.spotify.com/user/#{user}" target="_blank" class="jektify__user-link jektify__user-link--#{theme} jektify__user-link--custom" title="#{text}">
                <span class="jektify__user-text jektify__user-text--#{theme} jektify__user-text--custom">#{text}</span>
              </a>
            </div>
          HTML
        end
      end

      return unless app_root_config["enable"]

      <<~HTML
        <dl class="jektify jektify--#{theme} jektify--custom">
          <dt class="jektify__header jektify__header--#{theme} jektify__header--custom">
            <a class="jektify__brand jektify__brand--#{theme} jektify__brand--custom" href="https://#{app_name}.github.io" target="_blank">#{app_name}</a>
            <i class="jektify__year jektify__year--#{theme} jektify__year--custom">&copy;&nbsp;#{$DATETIME.year}&nbsp;</i>
            #{toggle_button}
          </dt>
          <dd class="jektify__body jektify__body--#{theme} jektify__body--custom" style="display: #{open_track}">
            #{spotify_user_html}
            <h1 class="jektify__title jektify__title--#{theme} jektify__title--custom" style="display: #{jektify_title};">#{app_root_config.dig("title", "text")}</h1>
            <p class="jektify__description jektify__description--#{theme} jektify__description--custom" style="display: #{jektify_description};">#{app_root_config.dig("description", "text")}</p>
            <div class="jektify__tracklist jektify__tracklist--#{theme} jektify__tracklist--custom">
              <iframe id="jektify__track" class="jektify__track jektify__track--#{theme} jektify__track--custom"
                      src="#{url}" width="100%" height="#{box_height}" frameborder="0"
                      allowtransparency="true" allow="encrypted-media">
              </iframe>
            </div>
          </dd>
        </dl>
      HTML
    end
  end
end
