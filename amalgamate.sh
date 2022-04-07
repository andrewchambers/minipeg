# Amalgamate the source code, sqlite3 style.
echo "/* This file is a generated distributable version of the minipeg project."
echo " * Visit https://github.com/andrewchambers/minipeg for details. */"
cat *.c | grep '^#include <' | sort -u
for f in version.h tree.h compile.c tree.c peg.c
do
  echo "#line 0 \"$f\""
  grep -v '^#include' "$f"
done
