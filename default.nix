{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonApplication rec {
  pname = "norminette";
  version = "3.3.51";

  src = fetchFromGitHub {
    owner = "42School";
    repo = "norminette";
    rev = "${version}";
    sha256 = "sha256-JpWziUKZPOD+AwiYeHR7e0B9l3XKNNp+XQkZEvynKGY=";
  };

  doCheck = false;
}
