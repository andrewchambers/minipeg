# Amalgamate the source code, sqlite3 style.
set -eu
cat <<EOF
/*
   This file is a distributable version of the minipeg[1] project.
   Visit https://github.com/andrewchambers/minipeg for source code.
*/
EOF
(
  for f in "$@"
  do
    case "$f" in
      *.c)
      cat "$f"
      ;;
    esac
  done
) | grep '^#include <' | sort -u

for f in "$@"
do
  echo "#line 0 \"$f\""
  grep -v '^#include' "$f"
done
