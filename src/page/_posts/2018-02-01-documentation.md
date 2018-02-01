---
layout: default
title: "Documentation"
date:   2018-02-01 07:31:10
---


{: .markdown__h1}
# Table of contents

* Do not remove this line (it will not be displayed)
{: toc}


{:.markdown__h1}
# Resume

{:.markdown__h2}
## Why does Jektify exist?

{: .markdown__paragraph}
Beautiful and Customizable, much more appealing than a simple "iframe"!

{: .markdown__paragraph}
[Jektify]{:target="_blank"}{: .markdown__link} is a jewel using to enter a theme for track entry, playlist, albums and artists of [Spotify]{:target="_blank"}{: .markdown__link}, in [Jekyll]{:target="_blank"}{: .markdown__link} templates.

{: .markdown__paragraph}
Besides inserting music is fully responsive, adjusting as your page layout, even on mobile devices.

{: .markdown__paragraph}
You need to install, so let's mission:

{:.markdown__h1}
# Dependencies

<a class="markdown__link no-decoration" href="https://gemnasium.com/github.com/williamcanin/jektify" target="_blank"><img src="https://gemnasium.com/badges/github.com/williamcanin/jektify.svg" alt="Dependency Status"></a>

{: .markdown__paragraph}
You can see the dependencies of Jektify through [Gemnasium](https://gemnasium.com/github.com/williamcanin/jektify){:target="_blank"}{: .markdown__link}. All dependencies are listed.

{:.markdown__h1}
# Get Jektify

{: .markdown__paragraph}
Add **Jektify** to your Gemfile and run the command: `bundle install`:

{% highlight ruby linenos %}
group :jekyll_plugins do
  gem "jektify"
end
{% endhighlight %}

or run command:

{% highlight bash linenos %}
gem install jektify
{% endhighlight %}

{:.markdown__h1}
# Setting up

{:.markdown__h2}
## Setting up your stylesheet using Jekyll SASS

{: .markdown__paragraph}
If you use CSS Jekyll, insert this line in the manifest `main.scss` SASS of your project:

{% highlight sass linenos %}
@import "jektify";
{% endhighlight %}

{: .markdown__blockquote .markdown__paragraph}
> Note: It is advisable to insert the end of all imports

{:.markdown__h3}
### I do not use SASS Jekyll, now what?

{: .markdown__paragraph}
If you do not use the SASS Jekyll, see these settings [HERE](#do-not-use-sass-jekyll){: .markdown__link}

{:.markdown__h2}
## Configuration file "_config.yml"

{: .markdown__paragraph}
Now, you need to configure the file `_config.yml` your theme Jekyll.

{: .markdown__paragraph}
The following lines should be inserted:


{% highlight yaml linenos %}
plugins:
  - jektify

spotify:
  enable: true
  open: true
  toggle:
    using: true  
  user:
    name: williamcanin
    text: See me no Spotify
  sass:
    jekyll: true
    dir: "way/to/your/SASS/vendor"
  title:
    enable: true
    text: "Jektify"
  description:
    enable: true
    text: |
      Jekyll plugin to generate html snippets for embedding Spotify Musics.
      To listen to the full song, open your Spotify and start these musics.
{% endhighlight %}

{:.markdown__h3}
### Commenting:

{: .markdown__paragraph}
`[ Line 2 ]`{: .markdown__code} Report for Jekyll use **Jektify**.

{: .markdown__paragraph}
`[ Line 5 ]`{: .markdown__code} - Option: [ true / false ] Enables or disables the plugin for all site.

{: .markdown__paragraph}
`[ Line 6 ]`{: .markdown__code} - Option: [ true / false ]  In this line you define whether you want the "Jektify" let the music box in open or closed mode in page. Remember that if the "`toggle => using`" option is set to `false`, any value in this option will have no implication.

{: .markdown__blockquote .markdown__paragraph}
> If a different value of these two themes is inserted, the Jekyll Spotify
Plugin will have operation error.

{: .markdown__paragraph}
`[ Line 8 ]`{: .markdown__code} - Option [ true / false ] This feature enables you to enable or disable the Toggle function of the Jektify. If it is set to `true` a button in the upper right corner will exist for an action to scroll and unroll the window. If the value is equal to `false`, the button will not exist, only open window will be created, this causes the javascript of Jektify  not to be generated for the user, because the scrolling and unwinding depends on the script.

{: .markdown__paragraph}
`[ Line 10 ]`{: .markdown__code} - Option [ user Spotify ] Put your Spotify user on this line to create a redirect button in the Spotify online player. If `name` or `text` are empty, the Jektify will not render this option. So, if you do not want to use it, leave the values with nothing.

{: .markdown__paragraph}
`[ Line 11 ]`{: .markdown__code} - Option [ text ] Here is the custom text that the redirect button will have. Put a very attractive and short.

{: .markdown__h3}
### Do not use SASS Jekyll

{: .markdown__paragraph}
`[ Line 13 ]`{: .markdown__code} Option [ true / false ] This line is very important! In it you will define using the build SASS Jekyll or other compilation of SASS, as the Gulp. If you use the Jekyll, let `true`. If you do not use SASS of Jekyll leaves to `false`.

{: .markdown__paragraph}
`[ Line 14 ]`{: .markdown__code} Option [ path ] If the line `13` is` false`, you should inform the way the vendor folder of your SASS files. For example: If you store your SASS files in the `src/sass/vendor`, then that is the way you have to put in the variable `dir`.

{: .markdown__paragraph}
After setting the path and build the project, a folder will be created to export the SASS of Jektify, in the path of the `dir` . With this, you must load the exported SASS in your manifest (`main.scss`). For example:

{% highlight scss linenos %}
@import "{way/to/your/SASS/vendor}/jektify/jektify"
{% endhighlight %}

{: .markdown__paragraph}
`[ Line 16 and 19 ]`{: .markdown__code} - Option: [ true / false ]  If you want a title or description, leave to `true`. Otherwise, leave as `false`.

{: .markdown__paragraph}
`[ Line 17 and 20 ]`  If the line 16 (or line 19) is in the `true`, enter your title (or description) in variable `text`. So if you want a title and content inside the music box...use true.

{: .markdown__h1}
# Importing JavaScript

{: .markdown__blockquote .markdown__paragraph}
> `ATTENTION!`{: .markdown__code} Using Javascript in the Jektify will only be necessary if the Toggle feature is set to `true` at line 8(eight) in
 "[Configuration file _config.yml]({{ site.url }}{{ site.baseurl }}/#configuration-file-_configyml){: .markdown__link}".
**Before you begin, you must import the [JQuery]{:target="_blank"}{: .markdown__link} for your project.**

{: .markdown__paragraph}
After setting the `_config.yml` file and imported the SASS of **Jektify**, you must import the JavaScript **Jektify** for HTML. The **Jektify** copy the Javascript to the folder of the compiled site `_site`.

```
assets/js/jektify.min.js
```

{: .markdown__paragraph}
Do import JavaScript in `_layout/default.html` at the end of
</ body>, like this:

{% highlight html linenos %}
...
<script src="{ { "/assets/js/jektify.min.js" | prepend: site.baseurl } }" ></script>
</body>
{% endhighlight %}

{: .markdown__paragraph .markdown__blockquote}
> `Note 1`: Do not leave space between `{ {` and `} }`

{: .markdown__paragraph .markdown__blockquote}
> `Note 2`: Do not forget to load the script Jektify after [JQuery]{:target="_blank"}{: .markdown__link}.

{: .markdown__paragraph .markdown__blockquote}
> `Note 3`: Understand your project! In this case here, it is being charged only
with `baseurl` and slash before `assets`.

{: .markdown__h2}
## Importing with CDN:

{: .markdown__paragraph}
You can use CDN of the respective version:

{% highlight html linenos %}
---
<script src="https://cdn.rawgit.com/williamcanin/jektify/cdn/v[VERSION]/jektify.min.js"></script>
</body>
{% endhighlight %}

{: .markdown__paragraph}
You can see the CDNs of the other [VERSION] in:

{: .markdown__paragraph}
[Jektify - CDN Versions](https://github.com/williamcanin/jektify/tree/master/cdn){:target="_blank"}{: .markdown__link}

{: .markdown__h1}
# Using

{: .markdown__h3}
### How does Jektify work?

{: .markdown__paragraph}
The **Jektify** capture songs, playlists and albums from artists in the Spotify, by URI code distributed by Spotify. You can do this by the Spotify application on your computer or through Spotify in the browser.

{: .markdown__paragraph}
First you have to get the URL of the song, album, playlist, of artist you want. An easy way to know how to do this is in the [Spotify]{:target="_blank"}{: .markdown__link} of support documentation, [here](https://developer.spotify.com/technologies/widgets/spotify-play-button/#generator){:target="_blank"}{: .markdown__link}.

{: .markdown__paragraph}
See an illustrative picture of how to capture the URI:

<img class="img-fluid d-block mx-auto" src="{{ "/assets/images/doc/capture_uri.jpg" | prepend: site.baseurl | prepend: site.url }}" alt="Capture URI">

{: .markdown__paragraph}
It will open a dialog, when open click `URI` to copy.

{: .markdown__paragraph}
What you will get looks like this:

```
spotify:track:08mG3Y1vljYA6bvDt4Wqkj
```

{: .markdown__paragraph}
The **Jektify** will use this URI, the only difference being that instead of being `:` will be `/`. See below how it works.

{: .markdown__h3}
### Tag Jektify

{: .markdown__paragraph}
The **Jektify** it works with the following tags:

{% highlight ruby linenos %}
{ % spotify [user]/[type]/[id]/[theme] % }
{% endhighlight %}

{: .markdown__blockquote .markdown__paragraph}
> Note: There can be no spaces between the keys. This here for the **Jektify** does not come into work.

{: .markdown__paragraph}
Note that there are three (4) parameters, all separated by slash. Let us know what each one does:

{: .markdown__paragraph}
`[user]`{: .markdown__code}  Option [ spotify / your_user ]  

{: .markdown__paragraph}
By default it is `spotify`. Will only change if you use `playlist` in the second parameter (type), which will have to inform the user of the playlist.

{: .markdown__paragraph}
`[type]`{: .markdown__code} Option [ track / album / playlist / artist ]

{: .markdown__list}
 - This is the parameter with more options, it will inform you, that the ID **Jektify** will insert, if a track, album, playlist or artist.

{: .markdown__paragraph}
`[id]`{: .markdown__code} Option [ id ]

{: .markdown__list}
 - Here is the track ID, album, playlist, artist constituted by an extension number.

{: .markdown__paragraph}
`[theme]`{: .markdown__code} Option [ white / dark ]

{: .markdown__list}
- Here you put a theme, Spotify makes available 2 (two) at the moment, the "dark" and the "light".

{: .markdown__paragraph}
**Example:**

{% highlight ruby linenos %}
{ % spotify spotify/track/62qsgMnY4wg8nE5qjyOdWO/dark % }

{ % spotify williamcanin/playlist/48brJJZdVifY79QAFmEImq/light % }

{ % spotify spotify/artist/711MCceyCBcFnzjGY4Q7Un/dark % }

{ % spotify spotify/album/6OwvO40ahugJE5PH4TjqTg/light % }
{% endhighlight %}

{: .markdown__blockquote .markdown__paragraph}
> Note: Do not leave spaces between the keys.

{: .markdown__h1}
# Customizable

{: .markdown__h2}
## SASS

{: .markdown__paragraph}
The **Jektify** already has an adequate customization to be responsive layouts, but still, leaves a customization feature own case the user does not choose the themes in hand and the way it fits in your page template.

{: .markdown__paragraph}
To customize to your liking, use the class `.jektify` in your stylesheets (SASS). Use your browser's developer tool. E.g: Google Dev Tools.

{: .markdown__paragraph}
The class structure `.jektify` this is:

{: .markdown__blockquote .markdown__paragraph}
> NOTE: You should put CSS properties inside the subclass "--custom".

{% highlight scss linenos %}

.jektify{
  &--custom{ }

  &__header{
    &--custom{}
  }

  &__brand{
    &--custom{}
  }

  &__year{
    &--custom{}
  }

  &__button{
    &--custom{}
  }

  &__body{
    &--custom{}
  }

  &__description{
    &--custom{}
  }

  &__title{
    &--custom{}
  }

  &__content{
    &--custom{}
  }

  &__tracklist{
    &--custom{}
  }

  &__track{
    &--custom{}
  }

}
{% endhighlight %}


{: .markdown__h1}
# Demos

{: .markdown__paragraph}
Here is examples of how the "Jektify" will behave in your page:

{: .markdown__h2}
## Track

{% spotify spotify/track/0C80GCp0mMuBzLf3EAXqxv/white %}

{: .markdown__h2}
## Playlist

{% spotify williamcanin/playlist/48brJJZdVifY79QAFmEImq/dark %}

{: .markdown__h2}
## Artist

{% spotify spotify/artist/711MCceyCBcFnzjGY4Q7Un/light %}

{: .markdown__h2}
## Album

{% spotify spotify/album/6OwvO40ahugJE5PH4TjqTg/dark %}

{: .markdown__h1}
# Report questions

{: .markdown__paragraph}
You can take doubt here: [GitHub Issues](https://github.com/williamcanin/jektify/issues){:target="_blank"}{: .markdown__link}

{: .markdown__h1}
# License

{: .markdown__paragraph}
The gem is available as open source under the terms of the [MIT]{:target="_blank"}{: .markdown__link}


---

{: .markdown__paragraph}
Copyright (c) {{ site.time | date: '%Y' }} William Canin

[Jektify]: https://github.com/williamcanin/jektify

[Spotify]: https://www.spotify.com

[JQuery]: https://jquery.com

[Jekyll]: https://jekyllrb.com

[MIT]: http://opensource.org/licenses/MIT
