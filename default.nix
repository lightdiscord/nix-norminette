{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonApplication rec {
  pname = "norminette";
  version = "3.2.3";

  src = fetchFromGitHub {
    owner = "42School";
    repo = "norminette";
    rev = "${version}";
    sha256 = "uYQ7UpOWwPosAJGQzFRNcbAZ4Lcu8CyKN9p9v+crcyE=";
  };

  doCheck = false;
}
