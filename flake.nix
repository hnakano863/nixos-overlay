{
  description = "my NixOS overlay";

  outputs = { self }:
  {

    overlay = final: prev: {
      # fonts
      iconsfordevs = final.callPackage ./fonts/iconsfordevs {};

      # polybar
      polybar = prev.polybar.override {
        i3Support = true;
        jsoncpp = final.jsoncpp;
      };

      # jupyter-command
      jupyterCommand = import ./jupyter-command { pkgs = prev; };

      vivaldi = (prev.vivaldi.override {
        proprietaryCodecs = true;
        inherit (prev) vivaldi-ffmpeg-codecs;
      });

      rWrapper = final.callPackage ./rlang {
        recommendedPackages = with final.rPackages; [
          boot class cluster codetools foreign KernSmooth lattice MASS
          Matrix mgcv nlme nnet rpart spatial survival
        ];
        packages = [];
      };

      # dictd-db
      dictdDBs = prev.dictdDBs // {
        eng2jpn = final.callPackage ./dictd-db/eng-jpn.nix {};
      };

      # nix-direnv flake integration
      nix-direnv = prev.nix-direnv.override { enableFlakes = true; };

      skk-dicts = final.callPackage ./skk-dicts/override.nix { inherit (prev) skk-dicts; };
      skk-dicts-cdb = final.callPackage ./skk-dicts/skk-dicts-cdb.nix {};
      yaskkserv2 = final.callPackage ./skk-dicts/yaskkserv2.nix {};
      dbskkd-cdb = final.callPackage ./skk-dicts/dbskkd-cdb.nix {};

      picom = prev.picom.overrideAttrs (oldAttrs: {
        version = "vNext";

        src = final.fetchFromGitHub {
          owner = "yshui";
          repo = "picom";
          rev = "vNext";
          sha256 = "MbF2iNCPR4NOMzFlrgVPj28AOqvmoHjoTCB1GR4UVys=";
          fetchSubmodules = true;
        };
      });

    }
    // (import ./julia final prev)
    // (import ./python final prev);

  };
}
