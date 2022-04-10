# Minipeg

[![builds.sr.ht status](https://builds.sr.ht/~ach/minipeg.svg)](https://builds.sr.ht/~ach/minipeg)

`minipeg` is a tool for generating recursive-descent parsers for use from C.

Unlike `lex` and `yacc`, `minipeg` supports unlimited backtracking, provide ordered choice as a means for disambiguation, and can combine scanning (lexical analysis) and parsing (syntactic analysis) into a single activity.

`minipeg` is also easy to add to your C project by copying minipeg.c into your project.

## Examples

See some examples:

- [word count](./examples/wc.peg)
- [calculator](./examples/calc.peg)
- [basic interpeter](./examples/basic.peg)
- [x86_64 assembler](https://raw.githubusercontent.com/andrewchambers/minias/master/asm.peg)

## Documentation

Read it online [here](https://ach.srht.site/minipeg).

Or read the man page directly:

```
man ./doc/minias.1
```

## History

`minipeg` started as a fork of peg/leg https://www.piumarta.com/software/peg/.
The aim of the fork is simplification (by removing the 'peg' syntax out of peg/leg)
and improving ease of distribution with a single file amalgamation.

## References

* [Ford 2004] Bryan Ford, [*Parsing Expression Grammars: A Recognition-Based Syntactic Foundation*][1]. ACM SIGPLAN Symposium on Principles of Programming Languages (POPL), 2004.

[1]: http://bford.info/pub/lang/peg "Parsing Expression Grammars: A Recognition-Based Syntactic Foundation"

## Version history

* **unreleased** 
Rename project to minipeg.
Deprecate and remove peg syntax (leg is the new and only syntax).
Add new amalgamated builds that can be distributed as a single file.
* **0.1.18**  
Add `-P` option to disable `#line` directives.  
Emit `#line` directives for all actions.  
* **0.1.17**  
Emit `#line` directives for header and trailer in the generated source file.
* **0.1.16**  
Add `@{...}` actions that are performed during matching.
* **0.1.15**  
Calls to `YY_FREE` fixed (thanks to Andrew Dunham).
* **0.1.14**  
Documentation typos fixed (thanks to Giulio Paci).
* **0.1.13**  
Predicate actions can refer to `yytext` (thanks to Grégory Pakosz).
Hexadecimal character escapes are supported by `leg` (thanks to Hugo Etchegoyen).
* **0.1.12**  
Use BSD-licensed `getopt()` in Windows build.  
Verbose mode handles Variable nodes.  
* **0.1.11**  
Add error actions via `"~"` operator.  
Support declaration of local variables at the top level of semantic actions.  
Dynamically grow data structures to remove artificial limits on rule recursion (thanks to Alex Klinkhamer).  
Many small changes to better support C++.  
Add build files for Win32 and MacOS (thanks to Fyodor Sheremetyev).  
Update manual page to describe new features.  
* **0.1.9**
Move global state into a structure to facilitate reentrant and thread-safe parsers (thanks to Dmitry Lipovoi).
* **0.1.8**
Allow nested, matched braces within actions.
* **0.1.7**
Fix matching of 8-bit chars to allow utf-8 sequences in matching expressions (thanks to Grégory Pakosz).
* **0.1.6**
Allow octal escapes in character classes.
* **0.1.5**
Remove dwarf sym dirs when cleaning.  
Fix size calculation when resizing text buffers.  
Backslash can be escaped.  
* **0.1.4**
Fix match of a single single quote character.  
Rename `getline` -> `nextline` to avoid C namespace conflict.  
* **0.1.3**
Allow matched braces inside `leg` actions.  
Handle empty rules.  
Handle empty grammars.  
* **0.1.2**
Grow buffers while (not if) they are too small.  
Remove dependencies on grammar files.  
Add more basic examples.  
* **0.1.1**
First public release.
