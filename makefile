CFLAGS = $$(pkg-config --cflags libgroove) -Wall
LDLIBS = $$(pkg-config --libs libgroove)

test-installation: test
	@./test
	@echo 'Currently installed libgroove.pc version:' \
	    $$(pkg-config --modversion libgroove)

.PHONY: test-installation
