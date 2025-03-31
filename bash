CC = gcc
CFLAGS = -Wall -Wextra -pedantic -std=c99
TARGET = hyprpad
PREFIX = /usr
CONFIG_DIR = /etc

all: $(TARGET)

$(TARGET): hyprpad.c
	$(CC) $(CFLAGS) -o $(TARGET) hyprpad.c

install: $(TARGET)
	install -Dm755 $(TARGET) $(DESTDIR)$(PREFIX)/bin/$(TARGET)
	if [ -f hyprpad.conf ]; then \
		install -Dm644 hyprpad.conf $(DESTDIR)$(CONFIG_DIR)/hyprpad.conf; \
	fi

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(TARGET)
	rm -f $(DESTDIR)$(CONFIG_DIR)/hyprpad.conf

clean:
	rm -f $(TARGET)