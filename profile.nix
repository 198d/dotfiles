with import <nixpkgs> {};

let
  dotfiles = import ./.;
in
[
  # core
  nix
  man

  # utils
  tree
  htop
  coreutils

  # tools
  openssh
  fish
  tmux
  neovim
  stow
  git
  pass

  # config
  dotfiles
]
