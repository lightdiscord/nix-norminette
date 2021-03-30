{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonApplication rec {
  pname = "norminette";
  version = "3.2.6";

  src = fetchFromGitHub {
    owner = "42School";
    repo = "norminette";
    rev = "${version}";
    sha256 = "G0tzFrlJffdUEbwm7xpeFa8J/nZkaqF6YHGHIACEOsk=";
  };

  doCheck = false;
}
