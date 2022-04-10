#!/bin/sh
set -eu
cat <<EOF
<!doctype html>
<meta name=viewport content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/minipeg/simple.css" type="text/css" />

<title>Minipeg - Parser generator for C</title>
</body>
<div class="container">
<h1><img id="logo" src="/minipeg/logo.png" alt>Minipeg</h1>
<p>
Minipeg is a parser generator for C that you can easily add
to your project as a single file.
</p>

<ul>
<li>Single file distribution <a href="https://git.sr.ht/~ach/minipeg/blob/master/minipeg.c">minipeg.c</a></li>
<li>Example <a href="https://git.sr.ht/~ach/minipeg/blob/master/examples/calc.peg">calculator</a></li>
<li>Example <a href="https://git.sr.ht/~ach/minias/blob/master/asm.peg">x86_64 assembler</a></li>
<li><a href="https://git.sr.ht/~ach/minipeg">Source code</a></li>
</ul>

<h2>Man Page</h2>
EOF
echo "<pre>"
mandoc -Tascii minipeg.1 | col -b | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g; s/"/\&quot;/g; s/'"'"'/\&#39;/g'
echo "</pre>"
cat <<EOF
</div>
</body>
EOF
