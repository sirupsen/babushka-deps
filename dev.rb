dep "homesick.gem" do
  # Override because we want to be able to re-run on a new ruby managed by
  # something else without installing homesick again
  met? {
    "~/.homesick".p.exists?
  }
end

dep "homesick" do
  requires "homesick.gem"

  met? {
    "~/.homesick/repos/dotfiles".p.exists?
  }
  meet {
    shell "homesick clone Sirupsen/dotfiles --force; echo 'done'"
    shell "homesick symlink dotfiles --force"
  }
end

dep "bash_profile" do
  met? {
    "~/.bash_profile".p.exists?
  }
  
  meet {
    "~/.bash_profile".p.append(". ~/.bashrc")
  }
end


dep "ssh" do
  requires "Dropbox.dir"

  met? {
    "~/.ssh/id_rsa".p.exists?
  }

  meet {
    shell "cp -r ~/Dropbox/Backups/ssh ~/.ssh"
  }
end

dep "git" do
  met? {
    false
  }

  meet {
    shell 'git config --global user.name "Simon Eskildsen"'
    shell 'git config --global user.email "sirup@sirupsen.com"'
  }
end

dep "vundle install" do
  met? {
    "~/.vim/bundle/vundle/README.md".p.exists?
  }

  meet {
    shell "rmdir ~/.vim/bundle/vundle"
    log "Removing empty vundle directory"

    log "Cloning vundle"
    shell "git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle"
    log "Vundle cloned, installing vim plugins.."

    system("vim +BundleInstall +qall")
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

dep "command-t" do
  requires "vim.managed", "chruby.managed", "vundle install"

  def path
    "~/.vim/bundle/Command-T/ruby/command-t"
  end

  met? {
    (path + "/match.o").p.exists?
  }

  meet {
    log "Compiling command-t.."
    shell "cd #{path} && ruby extconf.rb && make clean && make"
  }
end
