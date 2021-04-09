{ lib
, buildPythonPackage
, fetchPypi
, setupmeta
}:

buildPythonPackage rec {
  pname = "interface_meta";
  version = "1.2.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "db79caf4f4cf337d55c6582f77f49c8366a9b9748579adf167ff9e50ba82985c";
  };

  buildInputs = [ setupmeta ];

  doCheck = false;

  meta = with lib; {
    description = "A convenient way to expose an extensible API with enforced method signatures and consistent documentation.";
    homepage = "https://github.com/matthewwardrop/interface_meta";
    license = with licenses; [ mit ];
  };
}
