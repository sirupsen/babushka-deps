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

dep "iTerm colors" do
  requires "iTerm.app", "manual dir"

  def endpoint
    "~/.babushka/manual/Solarized_Dark.itermcolors"
  end

  met? {
    endpoint.p.exists?
  }

  meet {
    shell "curl https://raw.github.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors > #{endpoint}"
  }
end
