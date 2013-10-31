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
