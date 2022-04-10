DESTDIR	=
PREFIX	= /usr/local
BINDIR	= $(DESTDIR)$(PREFIX)/bin
MANDIR	= $(DESTDIR)$(PREFIX)/man/man1
CFLAGS = -g -O2 -Wall

SRC = version.h tree.h compile.c tree.c peg.c
GENSRC = minipeg-new.c peg.c www/index.html
OBJ = compile.o tree.o peg.o

all: minipeg

install: $(BINDIR) $(BINDIR)/leg $(MANDIR) $(MANDIR)/peg.1
	mkdir -p $(MANDIR) $(BINDIR)
	cp minipeg $(BINDIR)
	cp doc/minipeg.1 $(MANDIR)

$(MANDIR) :
	mkdir -p $(MANDIR)

bootstrap-minipeg: minipeg.c
	$(CC) $(CFLAGS) -o $@ minipeg.c

peg.c: peg.peg bootstrap-minipeg
	./bootstrap-minipeg -o $@ peg.peg

minipeg: $(OBJ)
	$(CC) $(CFLAGS) -o $@ $(OBJ)

minipeg-new.c: $(SRC) amalg.sh
	sh amalg.sh $(SRC) > $@

www/index.html: .FORCE
	sh ./www/index.html.sh > $@

%.c.noversion : %.c
	grep -v -e '#define MINIPEG_VERSION' $< > $@

# Check the bootstrap minipeg.c matches the built minipeg-new.c (without version info).
check-self-host: minipeg.c.noversion minipeg-new.c.noversion .FORCE
	diff -u minipeg.c.noversion minipeg-new.c.noversion

check: minipeg check-self-host .FORCE
	$(SHELL) -ec '(cd examples;  $(MAKE))'

clean : .FORCE
	rm -f minipeg bootstrap-minipeg rm *.c.noversion $(GENSRC) $(OBJ)
	$(SHELL) -ec '(cd examples;  $(MAKE) clean)'

.FORCE :
