CC ?= gcc
AR ?= ar

CFLAGS := -Iinclude -Wpedantic -Werror -Wall -O3
ARFLAGS := rcs

DESTDIR ?= /
PREFIX ?= usr

.PHONY: all clean
all: libminifb.a

clean:
	rm -f *.o
	rm -f *.a

install: libminifb.a include/MiniFB.h
	install -Dm 644 -t '$(DESTDIR)/$(PREFIX)/lib/' libminifb.a
	install -Dm 644 -t '$(DESTDIR)/$(PREFIX)/include/' include/MiniFB.h

libminifb.a: X11MiniFB.o
	$(AR) $(ARFLAGS) $@ $^

X11MiniFB.o: src/x11/X11MiniFB.c include/MiniFB.h
	$(CC) -o $@ -c $< $(CFLAGS)

