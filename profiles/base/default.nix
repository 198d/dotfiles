with import <nixpkgs> {};
with import ../../lib;

let
  dotfiles-base = mkDotfilesDerivation {
    profileName = "base";
    configSource = ./.;
    nvimPlugins = with vimPlugins; [
      base16-vim
      ctrlp
      vim-fish
      vim-nix
    ];
  };
in
[
  # utils
  tree
  htop
  coreutils
  gnupg
  pinentry
  pinentry-curses
  dpkg

  # tools
  openssh
  fish
  tmux
  neovim
  stow
  git
  pass
  jq
  vault

  # scripting
  ruby
  python3

  # config
  dotfiles-base
]
