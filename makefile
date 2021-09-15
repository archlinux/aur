CC = gcc
LIBS = -lncurses

SRC = main.c
EXE = $(ODIR)/term-sudoku
ODIR = bin

MANPATH = $(PREFIX)/share/man
PREFIX = /usr/local

term-sudoku: $(EXE)

run: $(EXE)
	bin/term-sudoku

file: $(EXE)
	bin/term-sudoku -f

install: $(EXE)
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f $(ODIR)/term-sudoku $(DESTDIR)$(PREFIX)/bin
	mkdir -p $(DESTDIR)$(MANPATH)/man1
	cp -f term-sudoku.1 $(DESTDIR)$(MANPATH)/man1/term-sudoku.1

uninstall:
	rm -f $(IDIR)/term-sudoku
	rm -f $(MANPATH)/man1/term-sudoku.1

clean:
	rm -rf $(ODIR)

$(ODIR):
	mkdir -p $@

$(EXE): $(SRC) | $(ODIR)
	$(CC) -o $@ $^ $(LIBS)
