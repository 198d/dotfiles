with import ../../lib;

[ 
  (mkDotfilesDerivation {
    profileName = "macos-guest";
    configSource = ./.;
  })
]
