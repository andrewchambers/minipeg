EXAMPLES = test rule accept wc dc dcv calc basic local erract

CFLAGS = -g -Wall -O3

DIFF = diff
TEE = cat >

all : $(EXAMPLES)

test : .FORCE
	../minipeg -o test.peg.c test.peg
	$(CC) $(CFLAGS) -o test test.c
	echo 'ab.ac.ad.ae.afg.afh.afg.afh.afi.afj.' | ./$@ | $(TEE) $@.out
	$(DIFF) $@.ref $@.out
	rm -f $@.out
	@echo

rule : .FORCE
	../minipeg -o rule.peg.c rule.peg
	$(CC) $(CFLAGS) -o rule rule.c
	echo 'abcbcdabcbcdabcbcdabcbcd' | ./$@ | $(TEE) $@.out
	$(DIFF) $@.ref $@.out
	rm -f $@.out
	@echo

accept : .FORCE
	../minipeg -o accept.peg.c accept.peg
	$(CC) $(CFLAGS) -o accept accept.c
	echo 'abcbcdabcbcdabcbcdabcbcd' | ./$@ | $(TEE) $@.out
	$(DIFF) $@.ref $@.out
	rm -f $@.out
	@echo

wc : .FORCE
	../minipeg -o wc.peg.c wc.peg
	$(CC) $(CFLAGS) -o wc wc.peg.c
	cat wc.peg | ./$@ | $(TEE) $@.out
	$(DIFF) $@.ref $@.out
	rm -f $@.out
	@echo

dc : .FORCE
	../minipeg -o dc.peg.c dc.peg
	$(CC) $(CFLAGS) -o dc dc.c
	echo '  2  *3 *(3+ 4) ' | ./dc | $(TEE) $@.out
	$(DIFF) $@.ref $@.out
	rm -f $@.out
	@echo

dcv : .FORCE
	../minipeg -o dcv.peg.c dcv.peg
	$(CC) $(CFLAGS) -o dcv dcv.c
	echo 'a = 6;  b = 7;  a * b' | ./dcv | $(TEE) $@.out
	$(DIFF) $@.ref $@.out
	rm -f $@.out
	@echo

calc : .FORCE
	../minipeg -o calc.peg.c calc.peg
	$(CC) $(CFLAGS) -o calc calc.peg.c
	echo 'a = 6;  b = 7;  a * b' | ./calc | $(TEE) $@.out
	$(DIFF) $@.ref $@.out
	rm -f $@.out
	@echo

basic : .FORCE
	../minipeg -o basic.peg.c basic.peg
	$(CC) $(CFLAGS) -o basic basic.peg.c
	( echo 'load "test"'; echo "run" ) | ./basic | $(TEE) $@.out
	$(DIFF) $@.ref $@.out
	rm -f $@.out
	@echo

local : .FORCE
	../minipeg -o local.peg.c local.peg
	$(CC) $(CFLAGS) -o local local.peg.c
	./$@ < local.peg | $(TEE) $@.out
	$(DIFF) $@.ref $@.out
	rm -f $@.out
	@echo

erract : .FORCE
	../minipeg -o erract.peg.c erract.peg
	$(CC) $(CFLAGS) -o erract erract.peg.c
	echo '6*9' | ./$@ | $(TEE) $@.out
	$(DIFF) $@.ref $@.out
	rm -f $@.out
	@echo

clean : .FORCE
	rm -f *.o *.peg.c $(EXAMPLES)

.FORCE :
