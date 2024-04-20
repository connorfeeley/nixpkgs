{ fetchFromGitHub
, lib
, stdenv
, postgresql
}:

stdenv.mkDerivation rec {
  pname = "index_advisor";
  version = "0.2.0";

  src = fetchFromGitHub {
    owner = "supabase";
    repo = "index_advisor";
    rev = "v${version}";
    hash = "sha256-G0eQk2bY5CNPMeokN/nb05g03CuiplRf902YXFVQFbs=";
  };

  buildInputs = [ postgresql ];

  makeFlags = [
    "datadir=${placeholder "out"}/share/postgresql"
  ];

  meta = with lib; {
    description = "PostgreSQL Index Advisor";
    homepage = "https://supabase.com/docs/guides/database/extensions/index_advisor";
    license = licenses.postgresql;
    inherit (postgresql.meta) platforms;
  };
}
