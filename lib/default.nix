with import <nixpkgs> {};

{
  mkDotfilesDerivation = { profileName, configSource, nvimPlugins ? [] }: stdenv.mkDerivation {
    name = "dotfiles-${profileName}";
    source = configSource;

    propagatedBuildInputs = nvimPlugins;

    phases = [
      "installPhase"
    ];

    installPhase = ''
      mkdir -p $out/bin

      # Scripts
      [ -d $source/bin ] && cp -r $source/bin $out

      # Dotfiles
      mkdir -p $out/share/dotfiles/${profileName}
      for config in $source/share/*; do
        cp -r --no-preserve=mode $config $out/share/dotfiles/${profileName}/.$(basename $config)
      done

      # Password Store
      if [ -d $out/share/dotfiles/${profileName}/.password-store ]; then
        [ -d $out/share/dotfiles/${profileName}/.password-store/.extensions ] && \
          chmod +x $out/share/dotfiles/${profileName}/.password-store/.extensions/*
        find $out/share/dotfiles/${profileName}/.password-store/ -type f | \
          xargs chmod +x
      fi

      # NVim Plugins
      mkdir -p $out/share/dotfiles/${profileName}/.config/nvim/bundle
      for plugin in ${toString nvimPlugins}; do
        cp -r --no-preserve=mode $plugin/share/vim-plugins/* $out/share/dotfiles/${profileName}/.config/nvim/bundle
      done
    '';
  };

  hashicorpRelease = { name, version, sha256 }: stdenv.mkDerivation {
    inherit version;

    name = "${name}-${version}";

    src = fetchzip {
      inherit sha256;
      url = "https://releases.hashicorp.com/${name}/${version}/${name}_${version}_linux_amd64.zip";
    };

    phases = [ "installPhase" ];

    installPhase = ''
      mkdir -p $out/bin
      cp $src/${name} $out/bin
    '';
  };
}
