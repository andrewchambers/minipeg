#!/bin/sh
set -eu
cat <<EOF
<!doctype html>
<meta name=viewport content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./simple.css" type="text/css" />

<title>Minipeg</title>
</body>
<div class="container">
<h1><img id="logo" src="logo.png" alt>Minipeg</h1>
<p>
Minipeg is a parser generator for C you can easily add
to your project as a single file.
</p>

<ul>
<li>Single file distribution <a href="https://github.com/andrewchambers/minipeg/releases">minipeg.c<a/></li>
<li>Example <a href="https://raw.githubusercontent.com/andrewchambers/minipeg/upstream/examples/calc.peg">calculator</a></li>
<li>Example <a href="https://raw.githubusercontent.com/andrewchambers/minias/master/asm.peg">x86_64 assembler</a></li>
<li><a href="https://github.com/andrewchambers/minipeg">Source code</a></li>
</ul>

<h2>Man Page</h2>
EOF
echo "<pre>"
mandoc -Tascii -Ofragment ./minipeg.1 | col -b
echo "</pre>"
cat <<EOF
</div>
</body>
EOF
