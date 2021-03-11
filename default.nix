{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonApplication rec {
  pname = "norminette";
  version = "3.2.1";

  src = fetchFromGitHub {
    owner = "42School";
    repo = "norminette";
    rev = "${version}";
    sha256 = "o3VMMRJg4JSQVw6VkoWb7bOmrT/b0WTiW0f9Zb7r5gM=";
  };

  doCheck = false;
}
