final: prev:
let
  buildPythonPackage = prev.python38Packages.buildPythonPackage;
  fetchPypi = prev.python38.fetchPypi;
in
{

  autograd-gamma = final.callPackage ./autograd-gamma { inherit buildPythonPackage fetchPypi; };

  formulaic = final.callPackage ./formulaic { inherit buildPythonPackage fetchPypi; };

  interface-meta = final.callPackage ./interface-meta { inherit buildPythonPackage fetchPypi; };

  lifelines = final.callPackage ./lifelines { inherit buildPythonPackage fetchPypi; };

}
