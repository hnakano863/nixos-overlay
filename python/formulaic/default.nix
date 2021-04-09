{ lib
, buildPythonPackage
, fetchPypi
, astor
, interface-meta
, numpy
, pandas
, scipy
, wrapt
, setupmeta
}:

buildPythonPackage rec {
  pname = "formulaic";
  version = "0.2.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "5b6a0336bafbf0127ee3c8ee61a91272144cbf9564e11459961e73911589cd84";
  };

  propagatedBuildInputs = [
    astor
    interface-meta
    numpy
    pandas
    scipy
    wrapt
  ];

  buildInputs = [ setupmeta ];

  doCheck = false;

  meta = with lib; {
    description = "A high-performance implementation of Wilkinson formulas for Python.";
    homepage = "https://github.com/matthewwardrop/formulaic";
    license = with licenses; [ mit ];
  };
}
