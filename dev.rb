dep "symlink dotfiles" do
  met? {
    "~/.dotfiles".p.exists?
  }

  meet {
    log "Cloning dotfiles.."
    shell "git clone git@github.com:Sirupsen/dotfiles.git ~/.dotfiles"
    log "Linking dotfiles.."
    system("cd ~/.dotfiles && ./linker.sh")
  }
end

dep "ssh" do
  requires "Dropbox.dir"

  met? {
    "~/.ssh/id_rsa".p.exists?
  }

  meet {
    shell "ln -s ~/Dropbox/Backups/ssh ~/.ssh"
  }
end

dep "neobundle" do
  requires "symlink dotfiles"

  met? {
    "~/.vim/bundle/neobundle.vim/README.md".p.exists?
  }

  meet {
    shell "rmdir ~/.vim/bundle/neobundle.vim"
    log "Removing empty neobundle directory"

    log "Cloning vundle"
    shell "git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim"
    log "Neobundle cloned, installing vim plugins.."

    system("vim +NeoBundleInstall")
  }
end

dep "code directory" do
  met? {
    "~/code".p.exists?
  }
  
  meet {
    shell "mkdir code"
  }
end

dep "manual.dir" do
  def path
    "~/.babushka/manual"
  end

  met? {
    path.p.exists?
  }

  meet {
    shell "mkdir #{path}"
  }
end

dep "Solarized.terminal" do
  requires "manual.dir" 
  def path
    "~/.babushka/manual/solarized.terminal"
  end

  met? {
    path.p.exists?
  }

  meet {
    shell "curl https://raw.github.com/tomislav/osx-terminal.app-colors-solarized/master/Solarized%20Dark.terminal > #{path}"
  }
end

dep "Vagrant.installer" do
  source "http://files.vagrantup.com/packages/a40522f5fabccb9ddabad03d836e120ff5d14093/Vagrant-1.3.5.dmg"
end
