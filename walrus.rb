dep "setup" do
  requires "iTerm.app", 
    "Google Chrome.app",
    "Dropbox.app",
    "Skype.app",
    "Evernote.app",
    "Transmission.app",
    "Spotify.app",
    "Flux.app",
    "VLC.app",
    "Doxie.app"

  # App config
  requires "symlink skype logs"

  # Dev
  requires "homesick", 
    "bash_profile",
    "ssh",
    "vundle install",
    "code directory"

  # OS X
  requires "remove dashboard",
    "current dir finder scope",
    "disable confirm application dialog",
    "tap to click",
    "disable notification center"

  # Manual
  requires "iTerm colors"

  # Fonts
  requires "Inconsolata.otf"
end
