{stdenv, fetchurl}:

stdenv.mkDerivation rec {
  name = "id3-${version}";
  version = "0.80";

  src = fetchurl {
    url = "https://github.com/squell/id3/releases/download/0.80/id3-0.80.tar.gz";
    sha256 = "aa61735c5806ed77b71de1408a78371d04add8c8c9b1532a055949081e5a35e2";
  };
  makeFlags=["prefix=$(out)"];
  installFlags=["install-full"];
  #buildInputs = [ list input packages here ];

  meta = with stdenv.lib; {
    maintainers = [maintainers.willghatch];
    description = "A portable command-line mass tagger";
    homepage = https://squell.github.io/id3/;
    license = licenses.bsd2;
    platforms = platforms.unix;
  };
}

