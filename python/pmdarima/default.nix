{ lib
, buildPythonPackage
, fetchPypi
, joblib
, numpy
, pandas
, scikitlearn
, scipy
, statsmodels
, urllib3
, setuptools
, cython
}:

buildPythonPackage rec {
  pname = "pmdarima";
  version = "1.8.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "c0c1f7860ce2f8399c71fc3ead31abc67c7dd9aab8da512b4f31fa919a1999f2";
  };

  buildInputs = [
    cython
  ];

  propagatedBuildInputs = [
    joblib
    numpy
    pandas
    scikitlearn
    scipy
    statsmodels
    urllib3
    setuptools
  ];

  doCheck = false;

  meta = with lib; {
    description = "Python's forecast::auto.arima equivalent";
    homepage = "http://alkaline-ml.com/pmdarima";
  };
}
