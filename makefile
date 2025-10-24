# Makefile for caelestia-gif manager
# version
VERSION = 1.0.0

# compiler
CC := gcc

# Flags
CDFLAGS := -Wall -Wextra -O2 -std=c11 -DVERSION=\"$(VERSION)\"
LDFLAGS := -lcjson

# Directories
SRC := caelestia-gif.c postinstall.c
OBJ := $(SRC:.c=.o)
BIN := caelestia-gif
HDR = color.h postinstall.h



#DESTDIR ?= $(HOME)/.local
DESTDIR ?= /usr

# Default target
all: $(BIN) $(INSBIN)

# Build the binary
$(BIN): $(OBJ) $(HDR)
	$(CC) $(OBJ) -o $@ $(LDFLAGS)


# Compile source files
%.o: %.c
	$(CC) $(CDFLAGS) -c $< -o $@

# Clean up build files
clean:
	rm -f $(OBJ) $(BIN)

build: 
	mkdir -p build
	cd build
	$(CC) $(CDFLAGS) $(SRC) -o build/$(BIN) $(LDFLAGS)

# Install the binary
install: $(BIN)
	# mkdir -p /usr/bin
	cp $(BIN) /usr/bin/$(BIN)
	chmod +x /usr/bin/$(BIN)
	@echo "$(BIN) installed to $(DESTDIR)/bin/"
	@echo "Remember to add $(DESTDIR)/bin to your PATH if it's not already there."
	@echo "You can do this by adding the following line to your shell configuration file (e.g., .bashrc, .zshrc):"
	@echo '	 export PATH="$(DESTDIR)/bin:$$PATH"'

uninstall:
	rm -f /usr/bin/$(BIN)
	@echo "$(BIN) removed from /usr/bin/"

# Phony targets
.PHONY: all clean install
