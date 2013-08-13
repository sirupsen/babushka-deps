dep 'user font dir exists' do
  met? {
    "~/Library/Fonts".p.dir?
  }
  meet {
    log_shell "Creating ~/Library/Fonts", "mkdir ~/Library/Fonts"
  }
end

meta 'otf' do
  accepts_list_for :source
  
  def dest
    "~/Library/Fonts/#{name}".p
  end

  template {
    requires 'user font dir exists'

    met? {
      dest.exists?
    }

    meet {
      source.each { |uri|
        Babushka::Resource.get(uri) { |file|
          log "Installing #{file}"

          file.mv(dest.expand_path)
        }
      }
    }
  }
end

dep "Inconsolata.otf" do
  source "http://www.levien.com/type/myfonts/Inconsolata.otf"
end
