dep "ruby-install.managed" do
  requires "chruby.managed"
end

meta :ruby do
  accepts_value_for :type, "ruby"
  accepts_value_for :version

  template {
    requires "ruby-install.managed"

    met? {
      # We delegate this to ruby-install
      rubies = Dir[File.expand_path("~/.rubies/**")]
      log rubies
      rubies.find { |ruby| ruby =~ /#{type}-#{version}/ }
    }

    meet {
      log "Installing Ruby: #{type}-#{version}"
      system("ruby-install --no-reinstall #{type} #{version}")
      log "Done"
    }
  }
end

dep "1.9.3.ruby" do
  version "1.9.3"
end

dep "2.0.0.ruby" do
  version "2.0.0"
end
