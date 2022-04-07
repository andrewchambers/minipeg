DESTDIR	=
PREFIX	= /usr/local
BINDIR	= $(DESTDIR)$(PREFIX)/bin
MANDIR	= $(DESTDIR)$(PREFIX)/man/man1
CFLAGS = -g -O2 -Wall

COMMONSRC = version.h tree.h compile.c tree.c
SRC = $(COMMONSRC) peg.c
NEWSRC = $(COMMONSRC) peg-new.c

all: minipeg

install: $(BINDIR) $(BINDIR)/leg $(MANDIR) $(MANDIR)/peg.1
	mkdir -p $(MANDIR) $(BINDIR)
	cp minipeg $(BINDIR)
	cp minipeg.1 $(MANDIR)

$(MANDIR) :
	mkdir -p $(MANDIR)

# Minipeg distributable amalgamation.
minipeg: minipeg.c

# Minipeg built from individual c files.
minipeg-split: $(SRC)
	$(CC) $(CFLAGS) -o $@ compile.c tree.c peg.c

minipeg.c: $(SRC)
	sh amalgamate.sh $(SRC) > $@

peg-new.c: peg.leg minipeg
	./minipeg -o $@ $<

peg-split.c: peg.leg minipeg-split
	./minipeg-split -o $@ $<

# The checked in peg.c matches the built peg-new.c.
# We also test peg-split.c to test our amalgamation process.
check-self-host: peg.c peg-new.c peg-split.c .FORCE
	diff -u peg-new.c peg.c
	diff -u peg-split.c peg.c

check: minipeg .FORCE
	$(SHELL) -ec '(cd examples;  $(MAKE))'

clean : .FORCE
	rm -f minipeg minipeg-split minipeg.c minipeg-new.c peg-new.c *.o

.FORCE :
