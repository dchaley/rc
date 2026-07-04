Shell configuration Run Commands (rc)
==

Config files, etc

# Setup

Note: this config is mostly developed on Mac unixen, and Linux. Pull requests welcome 🙏🏻

Instructions below assume checkout to `~/rc`.

## Dependencies

* homebrew
* ag + fzf (use homebrew)

## First-time installs

zsh will attempt to download plugins; internet access is required.

Run `:PlugInstall` in vim to fetch plugins.

## MacOS auto light-dark mode

* Install https://github.com/cormacrelf/dark-notify
* Set up the daemon,
  ```
  cd ~/Library/LaunchAgents/
  ln -s ~/rc/macos/com.user.darknotify.plist
  launchctl load com.user.darknotify.plist
  ```
