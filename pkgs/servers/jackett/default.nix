{ stdenv, fetchurl, mono, curl, makeWrapper }:

stdenv.mkDerivation rec {
  name = "jackett-${version}";
  version = "0.11.457";

  src = fetchurl {
    url = "https://github.com/Jackett/Jackett/releases/download/v${version}/Jackett.Binaries.Mono.tar.gz";
    sha256 = "139ga5qra6jrn3mkp08a5p495alxq78a8imfj4k8ywv1s05kw7dw";
  };

  buildInputs = [ makeWrapper ];

  installPhase = ''
    mkdir -p $out/{bin,share/${name}}
    cp -r * $out/share/${name}

    makeWrapper "${mono}/bin/mono" $out/bin/Jackett \
      --add-flags "$out/share/${name}/JackettConsole.exe" \
      --prefix LD_LIBRARY_PATH ':' "${curl.out}/lib"
  '';

  meta = with stdenv.lib; {
    description = "API Support for your favorite torrent trackers.";
    homepage = https://github.com/Jackett/Jackett/;
    license = licenses.gpl2;
    maintainers = with maintainers; [ edwtjo ];
    platforms = platforms.all;
  };
}
