CFLAGS+=-Wall -g
PROG=bffbook

all: $(PROG)

bffbook: bffbook.c
	$(CC) -Wall -g -o $@ $<

bffbook_full: bffbook_full.c
	$(CC) -Wall -g -o $@ $<

clean:
	$(RM) $(PROG)
