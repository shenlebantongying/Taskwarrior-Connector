**NOTICE: This software is in beta quality and still under heavy development.**

# Taskwarrior as a bookmark manager / "read-later app"

Why? After some research, i just realize that every bookmark managers on this planet suck.

Firefox's default manager is too primitive for power users.

+ Cannot archive a viewed link
+ Don't record when you bookmarked something
+ Plain tree structure (Bookmarks, like documents,can not be classified perfectly, one thing can exist in multiple nodes of a tree. Tagging is superior to collect links)

Taskwarrior is "accidentally" the best bookmark manager on Earth

+ Superb tagging and querying system
+ Plain JSON data storage (super easy git backup)
+ By easily adding and filer tags, users can manage a magnitude more things.
+ See clearly when you added the book mark and
+ Easily add more metadata to a bookmark entry
+ Never delete a bookmark, just mark it `Done` and you can revisits old links in future
+ More features

More importantly, easily combine with other command tools.

# INSTALLATION

1. Install [Taskwarrior](https://taskwarrior.org/)
2. Install the Firefox Extension at <https://addons.mozilla.org/firefox/addon/taskwarrior/>
3. Let the `taskwarrior_connector.py` to run in background. (Use terminal or use a service manager -> See below)
4. Add extra attribute `url` for taskwarrior entries 

```bash
yes | task config uda.url.type string
yes | task config uda.url.label URL
```

## For most Linux users-> Systemd setup

Just run `systemd_setup.bash`. It will let the connector script run in background forever.

To uninstall, use the `systemd_cleanup.bash` 

## For macOS Users -> Launchd setup

Just run `launchd_setup.bash`. It will let the connector script run in background forever.

To uninstall, use the `launchd_cleanup.bash` 

# Usage of Taskwarrior 

TaskWarrior is really powerful, and you should really read the [official documentation](https://taskwarrior.org/docs/) to grasp the ultimate management power.

Here is short list of commonly used commands if you intend to use taskwarrior as bookmark manager:

## Open a task's link
```bash
task _get {id}.url | xargs xdg-open # GNU/Linux
task _get {id}.url | xargs open # macOS
```

# Development

Please don't hesitate to report bugs and suggest new features.

# LICENSE

GPL3