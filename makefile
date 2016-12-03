CC=$(CXX)
INSTALLDIR=/usr/bin

all: rana
.phony: all

rana: rana.o
%.o: %.cpp helper.h

clean: clean-test-results
	rm -f rana *.o
.phony: clean

install: rana
	mv rana $(INSTALLDIR)
.phony: install

uninstall:
	rm -f $(INSTALLDIR)/rana
.phony: uninstall

test: rana
	sh ./tests/test.sh
.phony: test

clean-test-results:
	rm -f ./tests/*.html
.phony: clean-test-results
