with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "dotfiles";
  source = ./src;

  nvimPlugins = [
    vimPlugins.vim-nix
    vimPlugins.ctrlp
  ];

  phases = [
    "installPhase"
  ];

  installPhase = ''
      mkdir -p $out/bin
      cp -r $source/bin $out

      mkdir -p $out/share/dotfiles/home
      for config in $source/share/*; do
        cp -r --no-preserve=mode $config $out/share/dotfiles/home/.$(basename $config)
      done

      mkdir -p $out/share/dotfiles/home/.local/share/nvim/site
      for plugin in ${toString nvimPlugins}; do
        cp -r --no-preserve=mode $plugin/share/vim-plugins/*/{plugin,ftplugin,ftdetect,doc,color,syntax,indent,autoload} \
          $out/share/dotfiles/home/.config/nvim
      done
      ln -s ${neovim}/bin/nvim $out/bin/vim
  '';
}
