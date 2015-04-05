{ stdenv, fetchurl, gconf, gettext, gtk3, intltool, python, pythonDBus }:

stdenv.mkDerivation {
  name = "hamster-1.04";
  src = fetchurl {
    url = https://github.com/projecthamster/hamster/archive/hamster-time-tracker-1.04.tar.gz;
    md5 = "148ffee0c26c5c4ddfa4ebc9a21fa860";
  };
  buildPhase = "python ./waf configure build --prefix=$out";
  installPhase = "python ./waf install";
  buildInputs = [ gconf gettext gtk3 intltool python pythonDBus ];
}
