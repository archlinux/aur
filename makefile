CC = gcc
LIBS = -lncurses

SRC = main.c
EXE = $(ODIR)/term-sudoku
ODIR = bin
IDIR = /usr/local/bin

term-sudoku: $(EXE)

run: $(EXE)
	bin/term-sudoku

install: $(EXE)
	cp $(ODIR)/term-sudoku $(IDIR)/term-sudoku

uninstall:
	rm $(IDIR)/term-sudoku

clean:
	rm -rf $(ODIR)

$(ODIR):
	mkdir -p $@

$(EXE): $(SRC) | $(ODIR)
	$(CC) -o $@ $^ $(LIBS)
