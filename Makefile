DESTDIR	=
PREFIX	= /usr/local
BINDIR	= $(DESTDIR)$(PREFIX)/bin
MANDIR	= $(DESTDIR)$(PREFIX)/man/man1
CFLAGS = -g -Wall $(OFLAGS) $(XFLAGS) -Isrc
OFLAGS = -O3 -DNDEBUG

OBJ = leg.o tree.o compile.o
NEWOBJ = leg-new.o tree.o compile.o

all : leg

leg : $(OBJ)
	$(CC) $(CFLAGS) -o $@ $(OBJ)

leg-new : $(NEWOBJ)
	$(CC) $(CFLAGS) -o $@ $(NEWOBJ)

install : $(BINDIR) $(BINDIR)/leg $(MANDIR) $(MANDIR)/peg.1

$(BINDIR) :
	mkdir -p $(BINDIR)

$(BINDIR)/% : %
	cp -p $< $@
	strip $@

$(MANDIR) :
	mkdir -p $(MANDIR)

$(MANDIR)/% : src/%
	cp -p $< $@

uninstall : .FORCE
	rm -f $(BINDIR)/leg
	rm -f $(MANDIR)/peg.1

check-leg : leg.c .FORCE
	diff leg-new.c leg.c

leg-new.c :leg.leg leg
	./leg -o $@ $<

test examples : leg .FORCE
	$(SHELL) -ec '(cd examples;  $(MAKE))'

clean : .FORCE
	rm -f leg *.o

.FORCE :
