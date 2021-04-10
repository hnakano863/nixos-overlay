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
  version = "0.25.10";

  src = fetchPypi {
    inherit pname version;
    sha256 = "7e2df924e5c6725550e520da8ece9a46322eba6fbd00e8c7ddb46a01cedf1559";
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
