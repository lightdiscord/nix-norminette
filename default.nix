{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonApplication rec {
  pname = "norminette";
  version = "3.2.0";

  src = fetchFromGitHub {
    owner = "42School";
    repo = "norminette";
    rev = "${version}";
    sha256 = "gNt4+jV4MYPVy1gx5ys18yJWpMKi65luTD/v8TkuCcQ=";
  };

  patchPhase = ''
    # Since python 3.2, argparse is part of the python standard library.
    sed -i '/argparse/d' requirements.txt setup.cfg
  '';

  # Needed because they need to import pkg_resources.
  propagatedBuildInputs = [ python3Packages.setuptools ];

  doCheck = false;
}
