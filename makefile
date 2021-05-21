CC = gcc
CFLAGS = -I.
LIBS = -lncurses

SRC = main.c
DEPS = main.h
EXE = $(ODIR)/term-sudoku
OBJ = $(addprefix $(ODIR)/,$(SRC:.c=.o))
ODIR = bin
IDIR = /usr/local/bin

build: $(EXE)

run: $(EXE)
	bin/term-sudoku example.sudoku

uninstall:
	@rm $(IDIR)/term-sudoku
	@echo "removing term-sudoku bin from $(IDIR)"

clean:
	@rm -rf $(ODIR)
	@echo "removing local bin directory"

$(ODIR):
	mkdir -p $@

$(ODIR)/%.o: %.c $(DEPS) | $(ODIR)
	$(CC) -c -o $@ $< $(LIBS) $(CFLAGS)

$(EXE): $(OBJ)
	$(CC) -o $@ $^ $(LIBS) $(CFLAGS)

install: $(EXE)
	@echo "copying term-sudoku bin to $(IDIR)"
	@cp $(ODIR)/term-sudoku $(IDIR)/term-sudoku
