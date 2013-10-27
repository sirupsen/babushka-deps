dep "ruby-install.managed" do
  requires "chruby.managed"
end

meta :ruby do
  accepts_value_for :type, "ruby"
  accepts_value_for :version, "stable"

  template {
    requires "ruby-install.managed"

    meet {
      log "Installing Ruby: #{type}-#{version}"
      shell "ruby-install --no-reinstall #{type} #{version}"
    }
  }
end

dep "1.9.3.ruby" do
  version "1.9.3"
end

dep "stable.ruby" do
end
