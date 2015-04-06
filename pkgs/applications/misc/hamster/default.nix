{ stdenv, fetchurl, gconf, gettext, gnome_python, gtk3, intltool, makeWrapper, pycairo, pygtk, pygobject, python, pythonDBus, pyxdg }:

stdenv.mkDerivation {
  name = "hamster-1.04";
  src = fetchurl {
    url = https://github.com/projecthamster/hamster/archive/hamster-time-tracker-1.04.tar.gz;
    md5 = "148ffee0c26c5c4ddfa4ebc9a21fa860";
  };

  buildPhase = "python ./waf configure build --prefix=$out";

  installPhase = ''
    python ./waf install
    wrapProgram $out/bin/hamster \
      --prefix PYTHONPATH : "$(toPythonPath $out)" \
      --prefix PYTHONPATH : "$(toPythonPath ${gnome_python})" \
      --prefix PYTHONPATH : "$(toPythonPath ${pycairo})" \
      --prefix PYTHONPATH : "$(toPythonPath ${pygobject})" \
      --prefix PYTHONPATH : "$(toPythonPath ${pygobject})/gtk-2.0" \
      --prefix PYTHONPATH : "$(toPythonPath ${pygtk})/gtk-2.0" \
      --prefix PYTHONPATH : "$(toPythonPath ${pythonDBus})" \
      --prefix PYTHONPATH : "$(toPythonPath ${pyxdg})"
  '';
  buildInputs = [
    gconf gettext gnome_python gtk3 intltool makeWrapper pycairo
    pygobject pygtk python pythonDBus pyxdg
  ];
}
