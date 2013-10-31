dep 'iTerm.app' do
  source "http://iterm2.com/downloads/stable/iTerm2_v1_0_0.zip"
end

dep "Google Chrome.app" do
  source "http://dl.google.com/chrome/mac/dev/GoogleChrome.dmg"
end

dep 'Dropbox.app' do
  source 'http://cdn.dropbox.com/Dropbox%201.1.35.dmg'
end

dep 'Skype.app' do
  source 'http://www.skype.com/go/getskype-macosx.dmg'
end

dep 'Evernote.app' do
  source 'https://evernote.com/download/get.php?file=EvernoteMac'
end

dep 'Transmission.app' do
  source 'http://download.transmissionbt.com/files/Transmission-2.13.dmg'
end

dep 'Spotify.app' do
  source 'http://download.spotify.com/Spotify.dmg'
end

dep "Flux.app" do
  source "http://justgetflux.com/mac/Flux.zip"
end

dep "VLC.app" do
  source "http://get.videolan.org/vlc/2.0.8/macosx/vlc-2.0.8-intel64.dmg"
end

dep "Doxie.app" do
  source "http://cdn.getdoxie.com/resources/files/Doxie.dmg"
end

dep "VirtualBox.installer" do
  source "http://download.virtualbox.org/virtualbox/4.3.0/VirtualBox-4.3.0-89960-OSX.dmg"
  provides "VirtualBox", "VBoxManage", "VBoxHeadless"
end
