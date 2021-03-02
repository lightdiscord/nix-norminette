{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonApplication {
  pname = "norminette";
  version = "3.1.2";

  src = fetchFromGitHub {
    owner = "42School";
    repo = "norminette";
    rev = "5e4fafc9faf2c6608a8806e8a82653c2dee9f3ce";
    sha256 = "I63uJs3IWU8Cr0FKaSstItVC+hX9LG/b0Sln9pLty/g=";
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
