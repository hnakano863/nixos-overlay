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
    }
    // (import ./julia final prev)
    // (import ./python final prev);

  };
}
