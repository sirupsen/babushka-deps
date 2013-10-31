dep "symlink skype logs" do
#   requires "Skype.app"
# 
#   def skype_lib_path
#     '~/Library/Application\ Support/Skype/'.p.expand_path
#   end
# 
#   def dropbox_skype_path
#     '~/Dropbox/Backups/Skype/'.p.expand_path
#   end
# 
#   met? {
#     "#{skype_lib_path}/symlinked".p.exists?
#   }
# 
#   meet {
#     log "Removing skype lib path"
#     shell "rm -r #{skype_lib_path}"
# 
#     log "Symlinking"
#     shell "ln -s #{dropbox_skype_path} #{skype_lib_path}"
#   }
end

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

