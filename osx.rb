dep "remove dashboard" do
  meet {
    shell "defaults write com.apple.dashboard mcx-disabled -boolean YES"
    shell "killall Dock"
  }
end

dep "current dir finder scope" do
  meet {
    'defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"'
  }
end

dep "disable confirm application dialog" do
  meet {
    shell "defaults write com.apple.LaunchServices LSQuarantine -bool false"
  }
end

dep "tap to click" do
  meet {
    shell "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true"
  }
end

dep "disable notification center" do
  meet {
    shell "lunchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist"
  }
end
