{ stdenv, fetchurl, gconf, gettext, gtk3, intltool, python, pythonDBus }:

stdenv.mkDerivation {
  name = "hamster-1.04";
  builder = ./builder.sh;
  src = fetchurl {
    url = https://github.com/projecthamster/hamster/archive/hamster-time-tracker-1.04.tar.gz;
    md5 = "148ffee0c26c5c4ddfa4ebc9a21fa860";
  };
  inherit gconf gettext gtk3 intltool python pythonDBus;
}
