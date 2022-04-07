EXAMPLES = test rule accept wc dc dcv calc basic localpeg localleg erract

CFLAGS = -g -Wall -O3

DIFF = diff
TEE = cat >

all : $(EXAMPLES)

test : .FORCE
	../minipeg -o test.leg.c test.leg
	$(CC) $(CFLAGS) -o test test.c
	echo 'ab.ac.ad.ae.afg.afh.afg.afh.afi.afj.' | ./$@ | $(TEE) $@.out
	$(DIFF) $@.ref $@.out
	rm -f $@.out
	@echo

rule : .FORCE
	../minipeg -o rule.leg.c rule.leg
	$(CC) $(CFLAGS) -o rule rule.c
	echo 'abcbcdabcbcdabcbcdabcbcd' | ./$@ | $(TEE) $@.out
	$(DIFF) $@.ref $@.out
	rm -f $@.out
	@echo

accept : .FORCE
	../minipeg -o accept.leg.c accept.leg
	$(CC) $(CFLAGS) -o accept accept.c
	echo 'abcbcdabcbcdabcbcdabcbcd' | ./$@ | $(TEE) $@.out
	$(DIFF) $@.ref $@.out
	rm -f $@.out
	@echo

wc : .FORCE
	../minipeg -o wc.leg.c wc.leg
	$(CC) $(CFLAGS) -o wc wc.leg.c
	cat wc.leg | ./$@ | $(TEE) $@.out
	$(DIFF) $@.ref $@.out
	rm -f $@.out
	@echo

dc : .FORCE
	../minipeg -o dc.leg.c dc.leg
	$(CC) $(CFLAGS) -o dc dc.c
	echo '  2  *3 *(3+ 4) ' | ./dc | $(TEE) $@.out
	$(DIFF) $@.ref $@.out
	rm -f $@.out
	@echo

dcv : .FORCE
	../minipeg -o dcv.leg.c dcv.leg
	$(CC) $(CFLAGS) -o dcv dcv.c
	echo 'a = 6;  b = 7;  a * b' | ./dcv | $(TEE) $@.out
	$(DIFF) $@.ref $@.out
	rm -f $@.out
	@echo

calc : .FORCE
	../minipeg -o calc.leg.c calc.leg
	$(CC) $(CFLAGS) -o calc calc.leg.c
	echo 'a = 6;  b = 7;  a * b' | ./calc | $(TEE) $@.out
	$(DIFF) $@.ref $@.out
	rm -f $@.out
	@echo

basic : .FORCE
	../minipeg -o basic.leg.c basic.leg
	$(CC) $(CFLAGS) -o basic basic.leg.c
	( echo 'load "test"'; echo "run" ) | ./basic | $(TEE) $@.out
	$(DIFF) $@.ref $@.out
	rm -f $@.out
	@echo

localpeg : .FORCE
	../minipeg -o test.leg.c test.leg
	$(CC) $(CFLAGS) -o localpeg localpeg.c
	echo 'ab.ac.ad.ae.afg.afh.afg.afh.afi.afj.' | ./$@ | $(TEE) $@.out
	$(DIFF) $@.ref $@.out
	rm -f $@.out
	@echo

localleg : .FORCE
	../minipeg -o localleg.leg.c localleg.leg
	$(CC) $(CFLAGS) -o localleg localleg.leg.c
	./$@ < localleg.leg | $(TEE) $@.out
	$(DIFF) $@.ref $@.out
	rm -f $@.out
	@echo

erract : .FORCE
	../minipeg -o erract.leg.c erract.leg
	$(CC) $(CFLAGS) -o erract erract.leg.c
	echo '6*9' | ./$@ | $(TEE) $@.out
	$(DIFF) $@.ref $@.out
	rm -f $@.out
	@echo

clean : .FORCE
	rm -f *.o *.leg.c $(EXAMPLES)

.FORCE :
