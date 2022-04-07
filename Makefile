CFLAGS = -g -Wall $(OFLAGS) $(XFLAGS) -Isrc
OFLAGS = -O3 -DNDEBUG

OBJS = tree.o compile.o

all : leg

leg : leg.o $(OBJS)
	$(CC) $(CFLAGS) -o $@-new leg.o $(OBJS)
	mv $@-new $@

ROOT	=
PREFIX	= /usr/local
BINDIR	= $(ROOT)$(PREFIX)/bin
MANDIR	= $(ROOT)$(PREFIX)/man/man1

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

%.o : src/%.c
	$(CC) $(CFLAGS) -c -o $@ $<

leg.o : src/leg.c

check : check-leg

check-leg : leg.c .FORCE
	diff src/leg.c leg.c

leg.c : src/leg.leg leg
	./leg -o $@ $<

new : newleg

newleg : leg.c
	mv src/leg.c src/leg.c-
	mv leg.c src/.

test examples : leg .FORCE
	$(SHELL) -ec '(cd examples;  $(MAKE))'

clean : .FORCE
	rm -f leg *.o

.FORCE :
