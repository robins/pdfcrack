CFLAGS += -Wall -Wextra -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -O3 -g

OBJS = main.o sha256.o rc4.o md5.o pdfcrack.o pdfparser.o passwords.o common.o \
	benchmark.o
OBJS_PDFREADER = pdfparser.o pdfreader.o common.o

all: pdfcrack pdfreader

pdfcrack: $(OBJS)
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $(OBJS)

pdfreader: $(OBJS_PDFREADER)
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $(OBJS_PDFREADER)

install:
	cp pdfcrack pdfreader /usr/local/bin/

uninstall:
	rm -f /usr/local/bin/pdfcrack /usr/local/bin/pdfreader

clean:
	rm -f pdfcrack pdfreader testreader *.o

%.o: %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -c -o $@ $+
