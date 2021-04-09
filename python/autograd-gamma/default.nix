{ lib, buildPythonPackage, fetchPypi, autograd, scipy }:

buildPythonPackage rec {
  pname = "autograd-gamma";
  version = "0.5.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "f27abb7b8bb9cffc8badcbf59f3fe44a9db39e124ecacf1992b6d952934ac9c4";
  };

  propagatedBuildInputs = [ autograd scipy ];

  doCheck = false;

  meta = with lib; {
    description = "autograd compatible approximations to the derivatives of the Gamma-family of functions.";
    homepage = "https://github.com/CamDavidsonPilon/autograd-gamma";
    license = with licenses; [ mit ];
  };
}
