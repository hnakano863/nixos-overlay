{ lib
, buildPythonPackage
, fetchPypi
, numpy
, scipy
, pandas
, matplotlib
, autograd
, autograd-gamma
, formulaic
, setuptools
}:

buildPythonPackage rec {
  pname = "lifelines";
  version = "0.26.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "e9b3e45a81e4933aa5277168242d7f88b7e374d26e90aa6fb1242a08a8f50332";
  };

  propagatedBuildInputs = [
    numpy
    scipy
    pandas
    matplotlib
    autograd
    autograd-gamma
    formulaic
    setuptools
  ];

  doCheck = false;

  meta = with lib; {
    description = "Survival analysis in Python";
    homepage = "https://github.com/CamDavidsonPilon/lifelines";
    license = with licenses; [ mit ];
  };
}
