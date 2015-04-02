source $stdenv/setup

PATH=$gettext/bin:$gconf/bin:$gtk3/bin:$intltool/bin:$python/bin:$PATH

tar xvfz $src
cd hamster-*
patchShebangs .
python ./waf configure build --prefix=$out
python ./waf install
