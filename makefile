# Makefile for caelestia-gif manager
# version
VERSION = 1.0.0

# compiler
CC := gcc

# Flags
CDFLAGS := -Wall -Wextra -O2 -std=c11 -DVERSION=\"$(VERSION)\"
LDFLAGS := -lcjson

# Directories
SRC := caelestia-gif.c
OBJ := $(SRC:.c=.o)
BIN := caelestia-gif
HDR = color.h

INSSRC := install.c
INSOBJ := $(INSSRC:.c=.o)
INSBIN := install_bin

DESTDIR ?= $(HOME)/.local


# Default target
all: $(BIN) $(INSBIN)

# Build the binary
$(BIN): $(OBJ) $(HDR)
	$(CC) $(OBJ) -o $@ 

$(INSBIN): $(INSOBJ)
	$(CC) $(INSOBJ) -o $@ $(LDFLAGS)

# Compile source files
%.o: %.c
	$(CC) $(CDFLAGS) -c $< -o $@

# Clean up build files
clean:
	rm -f $(OBJ) $(BIN) $(INSOBJ) $(INSBIN)

# Install the binary
install: $(BIN)
	./$(INSBIN)
	mkdir -p $(DESTDIR)/bin
	cp $(BIN) $(DESTDIR)/bin/$(BIN)
	chmod +x $(DESTDIR)/bin/$(BIN)
	@echo "$(BIN) installed to $(DESTDIR)/bin/"
	@echo "Remember to add $(DESTDIR)/bin to your PATH if it's not already there."
	@echo "You can do this by adding the following line to your shell configuration file (e.g., .bashrc, .zshrc):"
	@echo '	 export PATH="$(DESTDIR)/bin:$$PATH"'

# Phony targets
.PHONY: all clean install
