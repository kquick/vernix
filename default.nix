{ stdenv, fetchgit, pkgs, git, cacert, nix-prefetch-git, cabal2nix }:
let
  pybuilder = pkgs.python36.withPackages (pp: with pp; [ thespian setproctitle ]);
in
  stdenv.mkDerivation {
    version = "2.0.1";
    name = "vernix";
    src = ./.;
    phases = [ "installPhase" ];
    installPhase =
      ''
        mkdir -p $out/bin
        cp $src/vernix $out/bin/
        chmod +x $out/bin/vernix
      '';
    propagatedBuildInputs = [ pybuilder git cacert nix-prefetch-git cabal2nix ];
  }
