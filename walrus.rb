dep "setup" do
  requires "iTerm.app", 
    "Dropbox.app",
    "Skype.app",
    "Evernote.app",
    "Transmission.app",
    "Spotify.app",
    "Flux.app",
    "VLC.app",
    "Doxie.app"

  # App config
  # requires "symlink skype logs"

  # Dev
  requires "homesick", 
    "bash_profile",
    "ssh",
    "vundle install",
    "code directory",
    "Solarized.terminal",
    "Vagrant.installer",
    "command-t"

  # Homebrew
  requires "wget.managed",
    "chruby.managed",
    "ruby-install.managed",
    "go.managed",
    "git.managed",
    "vim.managed",
    "the_silver_searcher.managed",
    "tmux.managed",
    "reattach-to-user-namespace.managed",
    "hub.managed",
    "openssl.managed",
    "mercurial.managed"

  # Rubies
  requires "1.9.3.ruby",
    "2.0.0.ruby"

  # OS X
  requires "dashboard.osx",
    "current dir finder scope.osx"

  # Fonts
  requires "Inconsolata.otf"
end
