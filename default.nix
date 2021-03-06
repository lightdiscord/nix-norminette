{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonApplication rec {
  pname = "norminette";
  version = "3.1.3";

  src = fetchFromGitHub {
    owner = "42School";
    repo = "norminette";
    rev = "${version}";
    sha256 = "N42Xz2JQ6/Wx3kvde4o+QyxjUpuYE2gvt2BwCteqQfw=";
  };

  patchPhase = ''
    # Since python 3.2, argparse is part of the python standard library.
    echo > requirements.txt

    # And, is it really necessary to run pip install inside setup.py ?
    sed -i '/pip install -r requirements.txt/d' setup.py
  '';

  # Needed because they need to import pkg_resources.
  propagatedBuildInputs = [ python3Packages.setuptools ];

  doCheck = false;
}
