{ pkgs }:
with pkgs;
let

  env = python3.withPackages (p: with p; [
    ipykernel numpy pandas matplotlib
  ]);

  definitions.python3 = {
    displayName = "Python3";
    argv = [
      env.interpreter
      "-m"
      "ipykernel_launcher"
      "-f"
      "{connection_file}"
    ];
    language = "python";
    logo32 = "${env.sitePackages}/ipykernel/resources/logo-32x32.png";
    logo64 = "${env.sitePackages}/ipykernel/resources/logo-64x64.png";
  };

  jupyterPath = jupyter-kernel.create { inherit definitions; };

  packageOverrides = final: prev: {
    jupyter_core = prev.jupyter_core.overridePythonAttrs (old: {
      makeWrapperArgs = [ "--set JUPYTER_PATH ${jupyterPath}" ];
    });
  };

  jupyterApp = (python3.override { inherit packageOverrides; }).withPackages (ps: [ ps.jupyter ]);

in stdenvNoCC.mkDerivation {
  name = "jupyter-command";
  phases = [ "installPhase" ];
  installPhase = ''
    mkdir -p $out/bin
    ln -s ${jupyterApp}/bin/jupyter $out/bin/jupyter
  '';
}
