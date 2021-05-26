CC = gcc
LIBS = -lncurses

SRC = main.c
EXE = $(ODIR)/term-sudoku
ODIR = bin

DESTDIR = /usr/local
IDIR = $(DESTDIR)/bin
MANPATH = $(DESTDIR)/share/man

term-sudoku: $(EXE)

run: $(EXE)
	bin/term-sudoku

install: $(EXE)
	mkdir -p $(IDIR)
	cp $(ODIR)/term-sudoku $(IDIR)/term-sudoku
	mkdir -p $(MANPATH)/man1
	cp term-sudoku.1 $(MANPATH)/man1/term-sudoku.1

uninstall:
	rm -f $(IDIR)/term-sudoku
	rm -f $(MANPATH)/man1/term-sudoku.1

clean:
	rm -rf $(ODIR)

$(ODIR):
	mkdir -p $@

$(EXE): $(SRC) | $(ODIR)
	$(CC) -o $@ $^ $(LIBS)
