dep "homesick.gem" do
end

dep "homesick" do
  requires "homesick.gem"

  met? {
    "~/.homesick/repos/Sirupsen/dotfiles".p.exists?
  }
  meet {
    shell "homesick clone Sirupsen/dotfiles --force"
    shell "homesick symlink Sirupsen/dotfiles --force"
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

    shell "vim +BundleInstall +qall"
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
