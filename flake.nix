{
  description = "my NixOS overlay";

  outputs = { self }:
  {

    overlay = final: prev: {
      # fonts
      cica = final.callPackage ./fonts/cica {};
      iconsfordevs = final.callPackage ./fonts/iconsfordevs {};
      feather-icon-font = final.callPackage ./fonts/icomoon-feather {};

      # polybar
      polybar = prev.polybar.override {
        i3Support = true;
        jsoncpp = final.jsoncpp;
      };

      # jupyter-command
      jupyterCmdFHS = import ./jupyterCmdFHS final prev;

      vivaldi = (prev.vivaldi.override {
        proprietaryCodecs = true;
        inherit (prev) vivaldi-ffmpeg-codecs;
      }).overrideAttrs (
        old: rec {
          version = "3.7.2218.55-1";
          src = builtins.fetchurl {
            url = "https://downloads.vivaldi.com/stable/vivaldi-stable_${version}_amd64.deb";
            sha256 = "11pik7a9nsfgw5xpjqaa7z25v5iz9ckg0ax84r6iyccrbifgc3hg";
          };
        }
      );

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
    }
    // (import ./julia final prev)
    // (import ./python final prev);

  };

}
