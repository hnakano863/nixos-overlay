final: prev:
let
  buildPythonPackage = prev.python38Packages.buildPythonPackages;
in
{

  autograd-gamma = final.callPackage ./autograd-gamma { inherit buildPythonPackages; };

  formulaic = final.callPackage ./formulaic { inherit buildPythonPackages; };

  interface-meta = final.callPackage ./interface-meta { inherit buildPythonPackages; };

  lifelines = final.callPackage ./lifelines { inherit buildPythonPackages; };

}
