final: prev:
let
  buildPythonPackage = prev.python38Packages.buildPythonPackage;
in
{

  autograd-gamma = final.callPackage ./autograd-gamma { inherit buildPythonPackage; };

  formulaic = final.callPackage ./formulaic { inherit buildPythonPackage; };

  interface-meta = final.callPackage ./interface-meta { inherit buildPythonPackage; };

  lifelines = final.callPackage ./lifelines { inherit buildPythonPackage; };

}
