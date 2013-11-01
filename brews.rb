dep "wget.managed" do
end

dep "go.managed" do
end

dep "chruby.managed" do
  # This is because Babushka doesn't understand chruby because it's an expored
  # bash function.
  met? {
    "~/.rubies".p.exists?
  }

  after {
    shell "mkdir ~/.rubies"
  }
end

dep "git.managed" do
end

dep "vim.managed" do
end

dep "the_silver_searcher.managed" do
  provides "ag"
end

dep "tmux.managed" do
end

dep "reattach-to-user-namespace.managed" do
  requires "tmux.managed"
end

dep "hub.managed" do
  requires "git.managed"
end

dep "openssl.managed" do
end

dep "mercurial.managed" do
  provides "hg"
end

dep "bazaar.managed" do
  provides "bzr"
end

dep "node.managed" do
end

dep "ctags.managed" do
end

dep "z.managed" do
  met? {
    "/usr/local/Cellar/z".p.exists?
  }
end

dep "sqlite.managed" do
  provides "sqlite3"
end

dep "gdb.managed" do
  provides "gdb"

  before {
    shell "(brew tap || grep homebrew/dupes) || brew tap homebrew/dupes"
  }
end

dep "scala.managed" do
end

dep "leiningen.managed" do
  provides "lein"
end
