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
	mkdir -p /$(HOME)/.local/bin
	cp $(BIN) /$(HOME)/.local/bin/$(BIN)
	chmod +x /$(HOME)/.local/bin/$(BIN)
	@echo "$(BIN) installed to /$(HOME)/.local/bin/"
	@echo "Remember to add /$(HOME)/.local/bin to your PATH if it's not already there."
	@echo "You can do this by adding the following line to your shell configuration file (e.g., .bashrc, .zshrc):"
	@echo '	 export PATH="/$(HOME)/.local/bin:$$PATH"'

# Phony targets
.PHONY: all clean install
