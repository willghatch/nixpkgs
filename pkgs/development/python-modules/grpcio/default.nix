{ stdenv, buildPythonPackage, fetchPypi, lib
, six, protobuf, enum34, futures, isPy27, isPy34 }:

buildPythonPackage rec {
  pname = "grpcio";
  version = "1.14.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "4bf23666e763ca7ff6010465864e9f088f4ac7ecc1e11abd6f85b250e66b2c05";
  };

  propagatedBuildInputs = [ six protobuf ]
                        ++ lib.optionals (isPy27 || isPy34) [ enum34 ]
                        ++ lib.optionals (isPy27) [ futures ];

  meta = with stdenv.lib; {
    description = "HTTP/2-based RPC framework";
    license = lib.licenses.asl20;
    homepage = "https://grpc.io/grpc/python/";
    maintainers = with maintainers; [ vanschelven ];
  };
}
