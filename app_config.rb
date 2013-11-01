dep "Dropbox.dir" do
  requires "Dropbox.app"

  met? {
    "~/Dropbox".p.exists?
  }

  meet {
    log "Copying Dropbox from USB.."
    shell 'cp /Volumes/Install\ OS\ X\ Mavericks/Dropbox.zip ~/'
    shell 'unzip -f Dropbox.zip'
  }
end

dep "manual dir" do
  def path
    "~/.babushka/manual".p
  end

  met? {
    path.exists?
  }

  meet {
    path.mkdir
  }
end

