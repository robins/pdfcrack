CFLAGS= -Wall -Wshadow -Wwrite-strings -Wsign-compare -Wfloat-equal \
	-Wmissing-noreturn -Wbad-function-cast \
	-Wmissing-prototypes -Winline -Wredundant-decls -O3

all: pdfcrack

pdfcrack: main.o rc4.o md5.o pdfcrack.o pdfparser.o passwords.o common.o \
	benchmark.o
	gcc $(CFLAGS) -o $@ $+
	strip $@

pdfreader: pdfparser.o pdfreader.o common.o
	gcc $(CFLAGS) -o $@ $+
	strip $@

clean:
	rm -f pdfcrack pdfreader testreader *.o

%.o: %.c
	gcc $(CFLAGS) -c -o $@ $+
