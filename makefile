PREFIX = /usr

run:
	./biblesay

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f biblesay.py $(DESTDIR)$(PREFIX)/bin/biblesay
	mkdir -p $(DESTDIR)$(PREFIX)/share/biblesay
	cp -f verses.txt $(DESTDIR)$(PREFIX)/share/biblesay

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/biblesay
	rm -f $(DESTDIR)$(PREFIX)/share/biblesay/verses.txt
