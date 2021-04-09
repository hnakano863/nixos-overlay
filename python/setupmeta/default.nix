{ lib
, buildPythonPackage
, fetchPypi
}:

buildPythonPackage rec {
  pname = "setupmeta";
  version = "3.0.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "c8d497af185637e03d8146477cdb717921621cde57935a0577cd1b7260d6bb63";
  };

  doCheck = false;

  meta = with lib; {
    description = "Simplify your setup.py";
    homepage = "https://github.com/codrsquad/setupmeta";
    license = with licenses; [ mit ];
  };


}
