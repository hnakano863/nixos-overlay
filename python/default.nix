final: prev:
{
  python3 = prev.python3.override {
    packageOverrides = final: prev: {

      autograd-gamma = final.callPackage ./autograd-gamma { };

      formulaic = final.callPackage ./formulaic { };

      setupmeta = final.callPackage ./setupmeta { };

      interface-meta = final.callPackage ./interface-meta { };

      lifelines = final.callPackage ./lifelines { };

    };
  };
}
