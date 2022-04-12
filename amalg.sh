# Amalgamate the source code, sqlite3 style.
set -eu
echo "/*"
echo "  ----------------------------------------------------------------"
echo "  | This file is a generated redistributable version of minipeg. |"
echo "  |   See https://ach.srht.site/minipeg/ for more information.   |"
echo "  ----------------------------------------------------------------"
sed 's/^/  /g' LICENSE
echo ""
echo "*/"
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
  echo "#line 1 \"$f\""
  grep -v '^#include' "$f"
done
