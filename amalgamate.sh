# Amalgamate the source code, sqlite3 style.
set -eu
cat <<EOF
/*
   Copyright (c) 2007 by Ian Piumarta
   Copyright (c) 2022 by Andrew Chambers
   All rights reserved.
   
   Permission is hereby granted, free of charge, to any person obtaining a
   copy of this software and associated documentation files (the 'Software'),
   to deal in the Software without restriction, including without limitation
   the rights to use, copy, modify, merge, publish, distribute, and/or sell
   copies of the Software, and to permit persons to whom the Software is
   furnished to do so, provided that the above copyright notice(s) and this
   permission notice appear in all copies of the Software.  Acknowledgement
   of the use of this Software in supporting documentation would be
   appreciated but is not required.
   
   THE SOFTWARE IS PROVIDED 'AS IS'.  USE ENTIRELY AT YOUR OWN RISK.

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
