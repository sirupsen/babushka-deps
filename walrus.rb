dep "setup" do
  requires "iTerm.app", 
    "Dropbox.app",
    "Skype.app",
    #"Evernote.app",
    "Transmission.app",
    "Spotify.app",
    "Flux.app",
    "VLC.app",
    "Doxie.app"
    #"Google Chrome.app",

  # App config
  # requires "symlink skype logs"

  # Dev
  requires "homesick", 
    "bash_profile",
    "ssh",
    "vundle install",
    "code directory",
    "Solarized.terminal",
    "Vagrant.installer"

  # Homebrew
  requires "wget.managed",
    "chruby.managed",
    "ruby-install.managed",
    "go.managed",
    "git.managed"

  # Rubies
  requires "1.9.3.ruby",
    "stable.ruby"

  # OS X
  requires "remove dashboard",
    "current dir finder scope",
    "disable confirm application dialog",
    "tap to click",
    "disable notification center"

  # Manual
  # requires "iTerm colors"

  # Fonts
  requires "Inconsolata.otf"
end
