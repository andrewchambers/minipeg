DESTDIR	=
PREFIX	= /usr/local
BINDIR	= $(DESTDIR)$(PREFIX)/bin
MANDIR	= $(DESTDIR)$(PREFIX)/man/man1
CFLAGS = -g -O2 -Wall

SRC = version.h tree.h compile.c tree.c peg.c
GENSRC = minipeg.c peg-new.c peg-amalg.c www/index.html
OBJ = compile.o tree.o peg.o

all: minipeg

install: $(BINDIR) $(BINDIR)/leg $(MANDIR) $(MANDIR)/peg.1
	mkdir -p $(MANDIR) $(BINDIR)
	cp minipeg $(BINDIR)
	cp doc/minipeg.1 $(MANDIR)

$(MANDIR) :
	mkdir -p $(MANDIR)

# Minipeg built from individual c files.
minipeg: $(OBJ)
	$(CC) $(CFLAGS) -o $@ $(OBJ)

# Minipeg distributable amalgamation.
minipeg-amalg: minipeg.c
	$(CC) $(CFLAGS) -o $@ minipeg.c

minipeg.c: $(SRC) amalg.sh
	sh amalg.sh $(SRC) > $@

peg-new.c: peg.peg minipeg
	./minipeg -o $@ peg.peg

peg-amalg.c: peg.peg minipeg-amalg
	./minipeg-amalg -o $@ peg.peg

www/index.html: .FORCE
	sh ./www/index.html.sh > $@

# Check the pregenerated peg.c matches the built peg-new.c.
# We also check peg-amalg.c to test our amalgamation process.
check-self-host: peg.c peg-new.c peg-amalg.c .FORCE
	diff -u peg-new.c peg.c
	diff -u peg-amalg.c peg.c

check: minipeg check-self-host .FORCE
	$(SHELL) -ec '(cd examples;  $(MAKE))'

clean : .FORCE
	rm -f minipeg minipeg-amalg $(GENSRC) $(OBJ)
	$(SHELL) -ec '(cd examples;  $(MAKE) clean)'

.FORCE :
