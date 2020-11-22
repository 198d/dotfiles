with import <nixpkgs> {};
with import ../../lib;

let
  dotfiles-clojure = mkDotfilesDerivation {
    profileName = "clojure";
    configSource = ./.;
    nvimPlugins = with vimPlugins; [
      vim-clojure-static
    ];
  };

  cljstyle = stdenv.mkDerivation rec {
    name = "cljstyle-${version}";
    version = "0.13.0";

    propagatedBuildInputs = [ zlib glibc ];

    src = fetchzip {
      url = "https://github.com/greglook/cljstyle/releases/download/${version}/cljstyle_${version}_linux.tar.gz";
      sha256 = "14ag6509k9vbbz4z68h102blyriq58hx60jqb3bffxadvwjhg5b8";
    };

    phases = [ "installPhase" "fixupPhase" ];

    installPhase = ''
      mkdir -p $out/bin
      cp $src/cljstyle $out/bin
      chmod -R u+w $out/bin
    '';

    fixupPhase = ''
      patchelf --add-needed ${zlib}/lib/libz.so.1 $out/bin/cljstyle
      patchelf --set-interpreter ${glibc}/lib64/ld-linux-x86-64.so.2 $out/bin/cljstyle
    '';
  };
in
[
  openjdk
  clojure
  leiningen
  cljstyle

  dotfiles-clojure
]
