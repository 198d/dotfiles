with import <nixpkgs> {};

{ profiles }:

let
  dotfiles-meta = writeTextFile {
    name = "dotfiles-meta";
    text = builtins.toJSON profiles;
    destination = "/share/dotfiles/profiles.json";
  };

  profilePackages = map (p: import (./. + "/profiles/${p}")) profiles;
in

[dotfiles-meta] ++ builtins.foldl' (x: y: x ++ y) (builtins.head profilePackages) (builtins.tail profilePackages)
