{ stdenv, bundlerEnv, fetchFromGitHub, makeWrapper, ruby }:
config:

let
  gems = bundlerEnv {
    name = "norminette-gems";
    gemdir = ./gemdir;
  };
in stdenv.mkDerivation {
  pname = "norminette";
  version = "20200408";

  src = fetchFromGitHub {
    owner = "42Paris";
    repo = "norminette";
    rev = "24e7407551b3a2ae8fe5253e9186d21d897689a1";
    sha256 = "sha256-SroBalIsgDqg1EhLJIclmRCNp896ds3nxT70zPZlWZY=";
  };

  buildInputs = [ makeWrapper ];

  installPhase = ''
    mkdir -p $out/{bin,lib}

    cp norminette.rb $out/lib
    ln -s ${config} $out/lib/config.conf
    makeWrapper ${gems}/bin/bundle $out/bin/norminette \
      --add-flags "exec ${ruby}/bin/ruby $out/lib/norminette.rb"
  '';
}
